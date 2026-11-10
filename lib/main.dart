import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;

import 'database/app_database.dart';
import 'modules/partners/partners_page.dart';
import 'modules/income_expenses/accounts_page.dart';
import 'modules/dairy/society_page.dart';

void main() {
  runApp(const FarmBusinessApp());
}

class FarmBusinessApp extends StatelessWidget {
  const FarmBusinessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farm Business Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF26734D)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F8F6),
      ),
      home: const AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  final AppDatabase database = AppDatabase();

  int selectedIndex = 0;
  bool isLoading = true;

  List<BusinessGroup> groups = [];
  List<BusinessesData> businesses = [];
  List<Partner> partners = [];

  final List<String> businessTypes = [
    'Dairy Farming',
    'Poultry Farming',
    'Banana Farming',
    'Rice Farming',
    'Pepper Farming',
    'Coffee Farming',
    'Rubber Farming',
    'Other Farming',
    'Other Business',
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final loadedGroups = await database.select(database.businessGroups).get();

      final loadedBusinesses = await database.select(database.businesses).get();

      final loadedPartners = await database.select(database.partners).get();

      if (!mounted) return;

      setState(() {
        groups = loadedGroups;
        businesses = loadedBusinesses;
        isLoading = false;
        partners = loadedPartners;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() => isLoading = false);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Database error: $error')));
    }
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  String groupName(int? id) {
    if (id == null) return 'Independent business';

    final matches = groups.where((group) => group.id == id);

    return matches.isEmpty ? 'Independent business' : matches.first.name;
  }

  Future<void> addGroup() async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Create Business Group'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Group name',
            hintText: 'Example: Kerala Farms',
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
              final name = controller.text.trim();
              if (name.isEmpty) return;

              try {
                await database
                    .into(database.businessGroups)
                    .insert(BusinessGroupsCompanion.insert(name: name));

                if (!dialogContext.mounted) return;
                Navigator.pop(dialogContext);

                await loadData();
              } catch (error) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not save group: $error')),
                );
              }
            },
            child: const Text('Create Group'),
          ),
        ],
      ),
    );

    controller.dispose();
  }

  Future<void> addBusiness() async {
    final nameController = TextEditingController();

    String selectedType = businessTypes.first;
    int? selectedGroup;

    await showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, updateDialog) => AlertDialog(
          title: const Text('Add Business'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Business name',
                    hintText: 'Example: Green Valley Dairy',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Business type',
                    border: OutlineInputBorder(),
                  ),
                  items: businessTypes
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      updateDialog(() => selectedType = value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<int?>(
                  initialValue: selectedGroup,
                  decoration: const InputDecoration(
                    labelText: 'Business group (optional)',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem<int?>(
                      value: null,
                      child: Text('No group - Independent'),
                    ),
                    ...groups.map(
                      (group) => DropdownMenuItem<int?>(
                        value: group.id,
                        child: Text(group.name),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    updateDialog(() => selectedGroup = value);
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

                try {
                  await database
                      .into(database.businesses)
                      .insert(
                        BusinessesCompanion.insert(
                          name: name,
                          businessType: selectedType,
                          groupId: Value(selectedGroup),
                        ),
                      );

                  if (!mounted || !dialogContext.mounted) return;

                  Navigator.pop(dialogContext);
                  await loadData();
                } catch (error) {
                  if (!dialogContext.mounted) return;
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    SnackBar(content: Text('Could not save business: $error')),
                  );
                }
              },
              child: const Text('Save Business'),
            ),
          ],
        ),
      ),
    );

    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final pages = [
      dashboardPage(),
      groupsPage(),
      businessesPage(),
      PartnerManagementPage(
        database: database,
        businesses: businesses,
        onChanged: loadData,
      ),
      AccountsPage(database: database, businesses: businesses),
      const PlaceholderPage(
        title: 'Reports',
        subtitle: 'Business-wise and consolidated reports',
        icon: Icons.bar_chart,
      ),
      SocietyPage(database: database, businesses: businesses),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Farm Business Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Settings',
            onPressed: () {
              setState(() => selectedIndex = 0);
            },
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 850)
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() => selectedIndex = index);
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.folder_outlined),
                  label: Text('Groups'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.business_outlined),
                  label: Text('Businesses'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.people_outline),
                  label: Text('Partners'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  label: Text('Accounts'),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.bar_chart),
                  label: Text('Reports'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.water_drop_outlined),
                  label: Text('Milk Society'),
                ),
              ],
            ),
          Expanded(child: pages[selectedIndex]),
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 850
          ? NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() => selectedIndex = index);
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.folder_outlined),
                  label: 'Groups',
                ),
                NavigationDestination(
                  icon: Icon(Icons.business_outlined),
                  label: 'Businesses',
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_outline),
                  label: 'Partners',
                ),
                NavigationDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  label: 'Accounts',
                ),
                NavigationDestination(
                  icon: Icon(Icons.water_drop_outlined),
                  label: 'Society',
                ),
                NavigationDestination(
                  icon: Icon(Icons.bar_chart),
                  label: 'Reports',
                ),
              ],
            )
          : null,
      floatingActionButton: selectedIndex == 1
          ? FloatingActionButton.extended(
              onPressed: addGroup,
              icon: const Icon(Icons.create_new_folder_outlined),
              label: const Text('Add Group'),
            )
          : selectedIndex == 2
          ? FloatingActionButton.extended(
              onPressed: addBusiness,
              icon: const Icon(Icons.add),
              label: const Text('Add Business'),
            )
          : null,
    );
  }

  Widget dashboardPage() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'Welcome to your Farm Business Manager',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Manage your businesses, farming activities and accounts in one place.',
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            statCard('Business Groups', groups.length, Icons.folder_outlined),
            statCard('Businesses', businesses.length, Icons.business_outlined),
            statCard('Farming Activities', 0, Icons.agriculture_outlined),
            statCard('Partners', partners.length, Icons.people_outline),
          ],
        ),
        const SizedBox(height: 28),
        const Text(
          'Your Businesses',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        if (businesses.isEmpty)
          emptyMessage(
            'No businesses added yet.',
            'Open Businesses to add your first farming business.',
          )
        else
          ...businesses.map(businessCard),
        const SizedBox(height: 28),
        const Text(
          'Quick Access',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            quickButton('Business Groups', Icons.folder, 1),
            quickButton('Businesses', Icons.business, 2),
            quickButton('Partners', Icons.people, 3),
            quickButton('Accounts', Icons.receipt_long, 4),
            quickButton('Reports', Icons.bar_chart, 5),
          ],
        ),
      ],
    );
  }

  Widget statCard(String title, int count, IconData icon) {
    return SizedBox(
      width: 210,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Colors.green.shade700),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(title, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quickButton(String label, IconData icon, int index) {
    return OutlinedButton.icon(
      onPressed: () => setState(() => selectedIndex = index),
      icon: Icon(icon),
      label: Text(label),
    );
  }

  Widget groupsPage() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'Business Groups',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Groups bring independent businesses together for consolidated reporting. A group does not merge their accounts or ownership.',
        ),
        const SizedBox(height: 20),
        if (groups.isEmpty)
          emptyMessage(
            'No groups created.',
            'Use Add Group to create a group such as Kerala Farms.',
          )
        else
          ...groups.map((group) {
            final members = businesses
                .where((b) => b.groupId == group.id)
                .toList();

            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.folder_outlined)),
                title: Text(
                  group.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${members.length} businesses'),
                trailing: const Icon(Icons.chevron_right),
              ),
            );
          }),
      ],
    );
  }

  Widget businessesPage() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'Independent Businesses',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Each business keeps its own partners, income, expenses and profit records. You can optionally assign it to a group.',
        ),
        const SizedBox(height: 20),
        if (businesses.isEmpty)
          emptyMessage(
            'No businesses added.',
            'Use Add Business to create your first business.',
          )
        else
          ...businesses.map(businessCard),
      ],
    );
  }

  Widget businessCard(BusinessesData business) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade50,
          child: const Icon(Icons.agriculture, color: Colors.green),
        ),
        title: Text(
          business.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${business.businessType} • ${groupName(business.groupId)}',
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget emptyMessage(String title, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            const Icon(
              Icons.agriculture_outlined,
              size: 42,
              color: Colors.green,
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const PlaceholderPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(subtitle, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            const Text(
              'This module is planned for the next development phase.',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
