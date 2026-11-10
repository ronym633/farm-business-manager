import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;

import 'society_sms_inbox_section.dart';
import '../../database/app_database.dart';

class SocietyPage extends StatefulWidget {
  final AppDatabase database;
  final List<BusinessesData> businesses;

  const SocietyPage({
    super.key,
    required this.database,
    required this.businesses,
  });

  @override
  State<SocietyPage> createState() => _SocietyPageState();
}

class _SocietyPageState extends State<SocietyPage> {
  List<MilkSociety> societies = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadSocieties();
  }

  Future<void> loadSocieties() async {
    final result = await widget.database
        .select(widget.database.milkSocieties)
        .get();

    if (!mounted) return;
    setState(() {
      societies = result;
      loading = false;
    });
  }

  String businessName(int id) {
    final matches = widget.businesses.where((b) => b.id == id);
    return matches.isEmpty ? 'Unknown business' : matches.first.name;
  }

  Future<void> addSociety() async {
    if (widget.businesses.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please create a business first.')),
      );
      return;
    }

    final nameController = TextEditingController();
    final locationController = TextEditingController();
    int selectedBusiness = widget.businesses.first.id;

    await showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, update) => AlertDialog(
          title: const Text('Add Milk Society'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Society name',
                    hintText: 'Example: Pallikunnu KSS',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location (optional)',
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  initialValue: selectedBusiness,
                  decoration: const InputDecoration(
                    labelText: 'Dairy business',
                  ),
                  items: widget.businesses.map((b) {
                    return DropdownMenuItem(value: b.id, child: Text(b.name));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      update(() => selectedBusiness = value);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isEmpty) return;

                await widget.database
                    .into(widget.database.milkSocieties)
                    .insert(
                      MilkSocietiesCompanion.insert(
                        businessId: selectedBusiness,
                        name: name,
                        location: locationController.text.trim().isEmpty
                            ? const Value.absent()
                            : Value(locationController.text.trim()),
                      ),
                    );

                if (!dialogContext.mounted) return;
                Navigator.pop(dialogContext);
                await loadSocieties();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );

    nameController.dispose();
    locationController.dispose();
  }

  Future<void> addSender(MilkSociety society) async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add SMS Sender'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Sender ID or mobile number',
            hintText: 'Example: PKSSBL',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final sender = controller.text.trim();
              if (sender.isEmpty) return;

              await widget.database
                  .into(widget.database.societySenders)
                  .insert(
                    SocietySendersCompanion.insert(
                      societyId: society.id,
                      senderIdentifier: sender,
                    ),
                  );

              if (!dialogContext.mounted) return;
              Navigator.pop(dialogContext);
              setState(() {});
            },
            child: const Text('Add Sender'),
          ),
        ],
      ),
    );

    controller.dispose();
  }

  Future<void> addProducer(MilkSociety society) async {
    final numberController = TextEditingController();
    final nameController = TextEditingController();

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Register Milk Producer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: numberController,
              decoration: const InputDecoration(
                labelText: 'Producer number',
                hintText: 'Example: 3383',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Producer name',
                hintText: 'Example: RANI MATHE',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final number = numberController.text.trim();
              final name = nameController.text.trim();

              if (number.isEmpty || name.isEmpty) return;

              await widget.database
                  .into(widget.database.milkProducers)
                  .insert(
                    MilkProducersCompanion.insert(
                      societyId: society.id,
                      producerNumber: number,
                      producerName: name,
                    ),
                  );

              if (!dialogContext.mounted) return;
              Navigator.pop(dialogContext);
              setState(() {});
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );

    numberController.dispose();
    nameController.dispose();
  }

  Future<void> showDetails(MilkSociety society) async {
    final senders = await (widget.database.select(
      widget.database.societySenders,
    )..where((t) => t.societyId.equals(society.id))).get();

    final producers = await (widget.database.select(
      widget.database.milkProducers,
    )..where((t) => t.societyId.equals(society.id))).get();

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, update) => AlertDialog(
          title: Text(society.name),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dairy business: ${businessName(society.businessId)}'),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SMS Senders',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          await addSender(society);
                          final updated =
                              await (widget.database.select(
                                    widget.database.societySenders,
                                  )..where(
                                    (t) => t.societyId.equals(society.id),
                                  ))
                                  .get();
                          update(() {
                            senders
                              ..clear()
                              ..addAll(updated);
                          });
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add'),
                      ),
                    ],
                  ),
                  if (senders.isEmpty)
                    const Text('No sender IDs registered yet.')
                  else
                    ...senders.map(
                      (s) => ListTile(
                        dense: true,
                        leading: const Icon(Icons.sms_outlined),
                        title: Text(s.senderIdentifier),
                      ),
                    ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Producers',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          await addProducer(society);
                          final updated =
                              await (widget.database.select(
                                    widget.database.milkProducers,
                                  )..where(
                                    (t) => t.societyId.equals(society.id),
                                  ))
                                  .get();
                          update(() {
                            producers
                              ..clear()
                              ..addAll(updated);
                          });
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add'),
                      ),
                    ],
                  ),
                  if (producers.isEmpty)
                    const Text('No producers registered yet.')
                  else
                    ...producers.map(
                      (p) => ListTile(
                        dense: true,
                        leading: const Icon(Icons.person_outline),
                        title: Text(p.producerName),
                        subtitle: Text('Producer No: ${p.producerNumber}'),
                      ),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addSociety,
        icon: const Icon(Icons.add),
        label: const Text('Add Society'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Milk Society Management',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Manage milk societies, SMS senders and producer registrations.',
          ),
          const SizedBox(height: 16),
          SocietySmsInboxSection(database: widget.database),
          const SizedBox(height: 20),
          if (societies.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'No milk societies added yet. Select Add Society to begin.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ...societies.map(
            (society) => Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.water_drop_outlined),
                ),
                title: Text(
                  society.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${businessName(society.businessId)}'
                  '${society.location == null ? '' : ' • ${society.location}'}',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => showDetails(society),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
