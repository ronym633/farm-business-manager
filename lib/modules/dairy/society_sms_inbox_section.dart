import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show OrderingTerm;

import '../../database/app_database.dart';
import 'society_sms_processing_service.dart';

import 'package:flutter/foundation.dart';

import 'society_sms_bridge.dart';

class SocietySmsInboxSection extends StatefulWidget {
  final AppDatabase database;

  const SocietySmsInboxSection({super.key, required this.database});

  @override
  State<SocietySmsInboxSection> createState() => _SocietySmsInboxSectionState();
}

class _SocietySmsInboxSectionState extends State<SocietySmsInboxSection> {
  List<SocietySmsMessage> messages = [];
  String selectedFilter = 'all';
  bool loading = true;
  bool processing = false;
  bool smsBusy = false;

  @override
  void initState() {
    super.initState();
    loadMessages();
    syncAllowedSenders();
  }

  Future<void> syncAllowedSenders() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return;
    }

    try {
      await SocietySmsBridge.updateAllowedSenders(widget.database);
    } catch (e) {
      debugPrint('Failed to sync SMS sender list: $e');
    }
  }

  Future<void> loadMessages() async {
    try {
      final result = await (widget.database.select(
        widget.database.societySmsMessages,
      )..orderBy([(table) => OrderingTerm.desc(table.receivedAt)])).get();

      if (!mounted) return;

      setState(() {
        messages = result;
        loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => loading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not load SMS messages: $error')),
      );
    }
  }

  List<SocietySmsMessage> get filteredMessages {
    if (selectedFilter == 'all') return messages;

    return messages
        .where((message) => message.processingStatus == selectedFilter)
        .toList();
  }

  int countStatus(String status) {
    return messages
        .where((message) => message.processingStatus == status)
        .length;
  }

  Future<void> processPending() async {
    setState(() => processing = true);

    try {
      final service = SocietySmsProcessingService(widget.database);
      await service.processPendingMessages();
      await loadMessages();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing failed: $error')));
    } finally {
      if (mounted) {
        setState(() => processing = false);
      }
    }
  }

  Future<void> enableSmsReception() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;

    setState(() => smsBusy = true);

    try {
      final granted = await SocietySmsBridge.requestPermission();

      if (!mounted) return;

      if (granted) {
        final count = await SocietySmsBridge.importPendingMessages(
          widget.database,
        );

        await loadMessages();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('SMS reception enabled. Imported $count message(s).'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('SMS permission was not granted.')),
        );
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not enable SMS reception: $error')),
      );
    } finally {
      if (mounted) setState(() => smsBusy = false);
    }
  }

  Future<void> importReceivedSms() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;

    setState(() => smsBusy = true);

    try {
      final granted = await SocietySmsBridge.hasPermission();

      if (!granted) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Enable SMS reception permission first.'),
          ),
        );
        return;
      }

      final count = await SocietySmsBridge.importPendingMessages(
        widget.database,
      );

      await loadMessages();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imported $count SMS message(s).')),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('SMS import failed: $error')));
    } finally {
      if (mounted) setState(() => smsBusy = false);
    }
  }

  Future<void> retryMessage(SocietySmsMessage message) async {
    setState(() => processing = true);

    try {
      final service = SocietySmsProcessingService(widget.database);
      await service.processMessage(message.id);
      await loadMessages();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Retry failed: $error')));
    } finally {
      if (mounted) {
        setState(() => processing = false);
      }
    }
  }

  String formatDate(DateTime date) {
    String twoDigits(int value) => value.toString().padLeft(2, '0');

    return '${twoDigits(date.day)}/${twoDigits(date.month)}/${date.year} '
        '${twoDigits(date.hour)}:${twoDigits(date.minute)}';
  }

  Color statusColor(String status) {
    switch (status) {
      case 'processed':
        return Colors.green;
      case 'review':
      case 'failed':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  void showMessage(SocietySmsMessage message) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Society SMS Details'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Sender: ${message.sender}'),
              const SizedBox(height: 6),
              Text('Received: ${formatDate(message.receivedAt)}'),
              const SizedBox(height: 6),
              Text('Status: ${message.processingStatus}'),
              if (message.detectedType != null) ...[
                const SizedBox(height: 6),
                Text('Type: ${message.detectedType}'),
              ],
              if (message.processingError != null) ...[
                const SizedBox(height: 12),
                const Text(
                  'Review reason:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(message.processingError!),
              ],
              const Divider(height: 24),
              const Text(
                'Original message:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SelectableText(message.messageBody),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Society SMS Inbox',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  tooltip: 'Refresh',
                  onPressed: loading ? null : loadMessages,
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _countChip('All', messages.length),
                _countChip('Pending', countStatus('pending')),
                _countChip('Processed', countStatus('processed')),
                _countChip('Review', countStatus('review')),
                _countChip('Failed', countStatus('failed')),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: processing || loading ? null : processPending,
                icon: processing
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.play_arrow),
                label: Text(
                  processing ? 'Processing...' : 'Process Pending Messages',
                ),
              ),
            ),
            const SizedBox(height: 12),

            if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) ...[
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: smsBusy ? null : enableSmsReception,
                  icon: const Icon(Icons.sms),
                  label: const Text('Enable SMS Reception'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: smsBusy ? null : importReceivedSms,
                  icon: smsBusy
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.download),
                  label: Text(smsBusy ? 'Importing...' : 'Import Received SMS'),
                ),
              ),
            ],

            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: selectedFilter,
              decoration: const InputDecoration(
                labelText: 'Filter messages',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'all', child: Text('All messages')),
                DropdownMenuItem(value: 'pending', child: Text('Pending')),
                DropdownMenuItem(value: 'processed', child: Text('Processed')),
                DropdownMenuItem(value: 'review', child: Text('Needs review')),
                DropdownMenuItem(value: 'failed', child: Text('Failed')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedFilter = value);
                }
              },
            ),
            const SizedBox(height: 8),
            if (loading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (filteredMessages.isEmpty)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('No SMS messages in this category yet.'),
                ),
              )
            else
              ...filteredMessages.map(
                (message) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(child: Icon(Icons.sms_outlined)),
                  title: Text(
                    message.detectedType ?? 'Unclassified SMS',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${message.sender}\n${formatDate(message.receivedAt)}',
                  ),
                  isThreeLine: true,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message.processingStatus.toUpperCase(),
                        style: TextStyle(
                          color: statusColor(message.processingStatus),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (message.processingStatus != 'processed')
                        IconButton(
                          tooltip: 'Retry processing',
                          onPressed: processing
                              ? null
                              : () => retryMessage(message),
                          icon: const Icon(Icons.refresh, size: 18),
                        ),
                    ],
                  ),
                  onTap: () => showMessage(message),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _countChip(String label, int count) {
    return Chip(
      label: Text('$label: $count'),
      visualDensity: VisualDensity.compact,
    );
  }
}
