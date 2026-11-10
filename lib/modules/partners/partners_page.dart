
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;

import '../../database/app_database.dart';

class PartnerManagementPage extends StatefulWidget {
  final AppDatabase database;
  final List<BusinessesData> businesses;
  final Future<void> Function()? onChanged;

  const PartnerManagementPage({
    super.key,
    required this.database,
    required this.businesses,
    this.onChanged,
  });

  @override
  State<PartnerManagementPage> createState() =>
      _PartnerManagementPageState();
}

class _PartnerManagementPageState
    extends State<PartnerManagementPage> {
  int? selectedBusinessId;
  List<Partner> partners = [];
  List<BusinessPartner> assignments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    if (widget.businesses.isNotEmpty) {
      selectedBusinessId = widget.businesses.first.id;
    }

    loadData();
  }

  @override
  void didUpdateWidget(covariant PartnerManagementPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.businesses.isNotEmpty &&
        !widget.businesses.any(
          (business) => business.id == selectedBusinessId,
        )) {
      selectedBusinessId = widget.businesses.first.id;
      loadData();
    }
  }

  Future<void> loadData() async {
    try {
      final loadedPartners =
          await widget.database.select(widget.database.partners).get();

      List<BusinessPartner> loadedAssignments = [];

      if (selectedBusinessId != null) {
        loadedAssignments = await
            (widget.database.select(widget.database.businessPartners)
              ..where(
                (table) => table.businessId.equals(selectedBusinessId!),
              )).get();
      }

      if (!mounted) return;

      setState(() {
        partners = loadedPartners;
        assignments = loadedAssignments;
        isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not load partners: $error')),
      );
    }
  }

  Partner? findPartner(int id) {
    for (final partner in partners) {
      if (partner.id == id) return partner;
    }
    return null;
  }

  double get totalPercentage {
    return assignments.fold(
      0,
      (total, assignment) => total + assignment.sharePercentage,
    );
  }

  double get remainingPercentage {
    return (100 - totalPercentage).clamp(0, 100).toDouble();
  }

  Future<void> addPartner() async {
    if (selectedBusinessId == null) return;

    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final shareController = TextEditingController();

    bool createNewPartner = true;
    int? existingPartnerId;

    await showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, updateDialog) => AlertDialog(
          title: const Text('Add Partner'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(
                      value: true,
                      label: Text('New Partner'),
                      icon: Icon(Icons.person_add_outlined),
                    ),
                    ButtonSegment(
                      value: false,
                      label: Text('Existing'),
                      icon: Icon(Icons.people_outline),
                    ),
                  ],
                  selected: {createNewPartner},
                  onSelectionChanged: (selection) {
                    updateDialog(() {
                      createNewPartner = selection.first;
                    });
                  },
                ),
                const SizedBox(height: 18),

                if (createNewPartner) ...[
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Partner name *',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone number (optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email (optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ] else ...[
                  DropdownButtonFormField<int>(
                    initialValue: existingPartnerId,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Select partner',
                      border: OutlineInputBorder(),
                    ),
                    items: partners
                        .where(
                          (partner) => !assignments.any(
                            (assignment) =>
                                assignment.partnerId == partner.id,
                          ),
                        )
                        .map(
                          (partner) => DropdownMenuItem(
                            value: partner.id,
                            child: Text(partner.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      updateDialog(() {
                        existingPartnerId = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  if (partners.isEmpty)
                    const Text('No existing partners. Create a new one.'),
                ],

                const SizedBox(height: 16),
                TextField(
                  controller: shareController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Ownership percentage *',
                    suffixText: '%',
                    border: OutlineInputBorder(),
                  ),
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
                final share = double.tryParse(
                  shareController.text.trim(),
                );

                if (share == null || share <= 0 || share > 100) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    const SnackBar(
                      content: Text('Enter a percentage between 0 and 100.'),
                    ),
                  );
                  return;
                }

                if (totalPercentage + share > 100.000001) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Only ${remainingPercentage.toStringAsFixed(2)}% is available.',
                      ),
                    ),
                  );
                  return;
                }

                if (createNewPartner &&
                    nameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    const SnackBar(
                      content: Text('Enter the partner name.'),
                    ),
                  );
                  return;
                }

                if (!createNewPartner &&
                    (existingPartnerId == null || partners.isEmpty)) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    const SnackBar(
                      content: Text('Select an existing partner.'),
                    ),
                  );
                  return;
                }

                try {
                  await widget.database.transaction(() async {
                    int partnerId;

                    if (createNewPartner) {
                      partnerId = await widget.database
                          .into(widget.database.partners)
                          .insert(
                            PartnersCompanion.insert(
                              name: nameController.text.trim(),
                              phone: Value(
                                phoneController.text.trim().isEmpty
                                    ? null
                                    : phoneController.text.trim(),
                              ),
                              email: Value(
                                emailController.text.trim().isEmpty
                                    ? null
                                    : emailController.text.trim(),
                              ),
                            ),
                          );
                    } else {
                      partnerId = existingPartnerId!;
                    }

                    await widget.database
                        .into(widget.database.businessPartners)
                        .insert(
                          BusinessPartnersCompanion.insert(
                            businessId: selectedBusinessId!,
                            partnerId: partnerId,
                            sharePercentage: share,
                          ),
                        );
                  });

                  if (!dialogContext.mounted) return;
                  Navigator.pop(dialogContext);

                  await loadData();
                  await widget.onChanged?.call();
                } catch (error) {
                  if (!dialogContext.mounted) return;

                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    SnackBar(content: Text('Could not save partner: $error')),
                  );
                }
              },
              child: const Text('Save Partner'),
            ),
          ],
        ),
      ),
    );

    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    shareController.dispose();
  }

  Future<void> editShare(BusinessPartner assignment) async {
    final controller = TextEditingController(
      text: assignment.sharePercentage.toString(),
    );

    final partner = findPartner(assignment.partnerId);

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Edit ${partner?.name ?? 'Partner'}'),
        content: TextField(
          controller: controller,
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Ownership percentage',
            suffixText: '%',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final newShare = double.tryParse(controller.text.trim());

              if (newShare == null || newShare <= 0 || newShare > 100) {
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  const SnackBar(
                    content: Text('Enter a percentage between 0 and 100.'),
                  ),
                );
                return;
              }

              final otherShares = totalPercentage -
                  assignment.sharePercentage;

              if (otherShares + newShare > 100.000001) {
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  const SnackBar(
                    content: Text('Total ownership cannot exceed 100%.'),
                  ),
                );
                return;
              }

              try {
                await (widget.database.update(
                  widget.database.businessPartners,
                )..where((table) => table.id.equals(assignment.id)))
                    .write(
                  BusinessPartnersCompanion(
                    sharePercentage: Value(newShare),
                  ),
                );

                if (!dialogContext.mounted) return;
                Navigator.pop(dialogContext);

                await loadData();
                await widget.onChanged?.call();
              } catch (error) {
                if (!dialogContext.mounted) return;

                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  SnackBar(content: Text('Could not update share: $error')),
                );
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedBusiness = widget.businesses.where(
      (business) => business.id == selectedBusinessId,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F6),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Text(
                  'Partner Management',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage partners and ownership separately for each business.',
                ),
                const SizedBox(height: 22),

                if (widget.businesses.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Please create a business before adding partners.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else ...[
                  DropdownButtonFormField<int>(
                    initialValue: selectedBusinessId,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Select Business',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: widget.businesses
                        .map(
                          (business) => DropdownMenuItem(
                            value: business.id,
                            child: Text(business.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedBusinessId = value;
                        isLoading = true;
                      });
                      loadData();
                    },
                  ),
                  const SizedBox(height: 20),

                  if (selectedBusiness.isNotEmpty) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedBusiness.first.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Ownership allocated'),
                                Text(
                                  '${totalPercentage.toStringAsFixed(2)}%',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: LinearProgressIndicator(
                                value: (totalPercentage / 100)
                                    .clamp(0, 1),
                                minHeight: 10,
                                backgroundColor: Colors.grey.shade200,
                                color: totalPercentage >= 99.999999
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${assignments.length} partners',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  '${remainingPercentage.toStringAsFixed(2)}% remaining',
                                  style: TextStyle(
                                    color: remainingPercentage == 0
                                        ? Colors.green.shade700
                                        : Colors.deepOrange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            if (remainingPercentage > 0)
                              const Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text(
                                  'Ownership allocation is incomplete. Add the remaining partner shares to reach 100%.',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            else
                              const Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text(
                                  'Ownership allocation is complete.',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Business Partners',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FilledButton.icon(
                          onPressed: addPartner,
                          icon: const Icon(Icons.person_add_alt_1),
                          label: const Text('Add Partner'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    if (assignments.isEmpty)
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(24),
                          child: Center(
                            child: Text(
                              'No partners assigned to this business yet.',
                            ),
                          ),
                        ),
                      )
                    else
                      ...assignments.map((assignment) {
                        final partner = findPartner(assignment.partnerId);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.person_outline),
                            ),
                            title: Text(
                              partner?.name ?? 'Unknown partner',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              partner?.phone ?? 'No phone number',
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${assignment.sharePercentage.toStringAsFixed(2)}%',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Edit percentage',
                                  onPressed: () => editShare(assignment),
                                  icon: const Icon(Icons.edit_outlined),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  ],
                ],
              ],
            ),
    );
  }
}
