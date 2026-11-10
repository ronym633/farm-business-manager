import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../database/app_database.dart';

class AccountsPage extends StatefulWidget {
  final AppDatabase database;
  final List<BusinessesData> businesses;

  const AccountsPage({
    super.key,
    required this.database,
    required this.businesses,
  });

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  int? selectedBusinessId;
  String selectedFilter = 'All';
  List<FinancialTransaction> transactions = [];
  bool isLoading = true;

  final List<String> incomeCategories = [
    'Milk Sales',
    'Animal Sales',
    'Egg Sales',
    'Crop Sales',
    'Harvest Sales',
    'Other Income',
  ];

  final List<String> expenseCategories = [
    'Feed',
    'Labour',
    'Fertilizer',
    'Seeds',
    'Medicine',
    'Veterinary',
    'Transport',
    'Electricity',
    'Water',
    'Equipment',
    'Maintenance',
    'Other Expense',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.businesses.isNotEmpty) {
      selectedBusinessId = widget.businesses.first.id;
    }
    loadData();
  }

  @override
  void didUpdateWidget(covariant AccountsPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.businesses.any(
      (business) => business.id == selectedBusinessId,
    )) {
      selectedBusinessId = widget.businesses.isEmpty
          ? null
          : widget.businesses.first.id;
      loadData();
    }
  }

  Future<void> loadData() async {
    try {
      List<FinancialTransaction> result = [];

      if (selectedBusinessId != null) {
        result =
            await (widget.database.select(widget.database.financialTransactions)
                  ..where(
                    (table) => table.businessId.equals(selectedBusinessId!),
                  )
                  ..orderBy([
                    (table) => OrderingTerm(
                      expression: table.transactionDate,
                      mode: OrderingMode.desc,
                    ),
                  ]))
                .get();
      }

      if (!mounted) return;

      setState(() {
        transactions = result;
        isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not load accounts: $error')),
      );
    }
  }

  List<FinancialTransaction> get activeTransactions =>
      transactions.where((item) => !item.isReversed).toList();

  double get totalIncome => activeTransactions
      .where((item) => item.transactionType == 'income')
      .fold(0, (total, item) => total + item.amount);

  double get totalExpenses => activeTransactions
      .where((item) => item.transactionType == 'expense')
      .fold(0, (total, item) => total + item.amount);

  double get netProfit => totalIncome - totalExpenses;

  String money(double amount) => '₹${amount.toStringAsFixed(2)}';

  Future<void> addTransaction(String type) async {
    if (selectedBusinessId == null) return;

    final amountController = TextEditingController();
    final descriptionController = TextEditingController();

    final categories = type == 'income' ? incomeCategories : expenseCategories;

    String selectedCategory = categories.first;
    DateTime selectedDate = DateTime.now();

    await showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, updateDialog) => AlertDialog(
          title: Text(type == 'income' ? 'Add Income' : 'Add Expense'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Amount *',
                    prefixText: '₹ ',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<String>(
                  initialValue: selectedCategory,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  items: categories
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      updateDialog(() => selectedCategory = value);
                    }
                  },
                ),
                const SizedBox(height: 14),
                OutlinedButton.icon(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: dialogContext,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );

                    if (date != null) {
                      updateDialog(() => selectedDate = date);
                    }
                  },
                  icon: const Icon(Icons.calendar_month),
                  label: Text(
                    'Date: ${selectedDate.day.toString().padLeft(2, '0')}/'
                    '${selectedDate.month.toString().padLeft(2, '0')}/'
                    '${selectedDate.year}',
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description (optional)',
                    hintText: 'Enter additional details',
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
                final amount = double.tryParse(amountController.text.trim());

                if (amount == null || !amount.isFinite || amount <= 0) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    const SnackBar(
                      content: Text('Enter a valid amount greater than zero.'),
                    ),
                  );
                  return;
                }

                try {
                  final description = descriptionController.text.trim();

                  await widget.database.transaction(() async {
                    final transactionId = await widget.database
                        .into(widget.database.financialTransactions)
                        .insert(
                          FinancialTransactionsCompanion.insert(
                            businessId: selectedBusinessId!,
                            transactionType: type,
                            category: selectedCategory,
                            amount: amount,
                            transactionDate: selectedDate,
                            description: Value(
                              description.isEmpty ? null : description,
                            ),
                          ),
                        );

                    await widget.database
                        .into(widget.database.transactionAuditLogs)
                        .insert(
                          TransactionAuditLogsCompanion.insert(
                            transactionId: transactionId,
                            action: 'created',
                            details: Value(
                              '$type: $selectedCategory, ${money(amount)}',
                            ),
                          ),
                        );
                  });

                  if (!dialogContext.mounted) return;
                  Navigator.pop(dialogContext);

                  await loadData();
                } catch (error) {
                  if (!dialogContext.mounted) return;

                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    SnackBar(content: Text('Could not save entry: $error')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );

    amountController.dispose();
    descriptionController.dispose();
  }

  Future<void> reverseTransaction(FinancialTransaction transaction) async {
    final reasonController = TextEditingController();

    final reason = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reverse Transaction'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'This entry will remain in the history but will no longer '
              'be included in income, expenses or profit.',
            ),
            const SizedBox(height: 14),
            TextField(
              controller: reasonController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Reason for reversal *',
                border: OutlineInputBorder(),
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
            onPressed: () {
              final reason = reasonController.text.trim();

              if (reason.isEmpty) {
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  const SnackBar(content: Text('Please enter a reason.')),
                );
                return;
              }

              Navigator.pop(dialogContext, reason);
            },
            child: const Text('Confirm Reversal'),
          ),
        ],
      ),
    );

    reasonController.dispose();

    if (reason == null || reason.isEmpty) return;

    try {
      await widget.database.transaction(() async {
        await (widget.database.update(
          widget.database.financialTransactions,
        )..where((table) => table.id.equals(transaction.id))).write(
          FinancialTransactionsCompanion(
            isReversed: const Value(true),
            reversedAt: Value(DateTime.now()),
            reversalReason: Value(reason),
          ),
        );

        await widget.database
            .into(widget.database.transactionAuditLogs)
            .insert(
              TransactionAuditLogsCompanion.insert(
                transactionId: transaction.id,
                action: 'reversed',
                details: Value(reason),
              ),
            );
      });

      await loadData();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not reverse transaction: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'Accounts',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Record and track income and expenses for each business.'),
        const SizedBox(height: 20),

        if (widget.businesses.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'Create a business first to start recording accounts.',
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
          const SizedBox(height: 18),

          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else ...[
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _summaryCard(
                  'Total Income',
                  totalIncome,
                  Colors.green,
                  Icons.trending_up,
                ),
                _summaryCard(
                  'Total Expenses',
                  totalExpenses,
                  Colors.red,
                  Icons.trending_down,
                ),
                _summaryCard(
                  'Net Profit',
                  netProfit,
                  netProfit >= 0 ? Colors.blue : Colors.deepOrange,
                  Icons.account_balance_wallet_outlined,
                ),
              ],
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                FilledButton.icon(
                  onPressed: () => addTransaction('income'),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Income'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                  ),
                ),
                FilledButton.icon(
                  onPressed: () => addTransaction('expense'),
                  icon: const Icon(Icons.remove),
                  label: const Text('Add Expense'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Transaction History',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'All', label: Text('All')),
                ButtonSegment(value: 'income', label: Text('Income')),
                ButtonSegment(value: 'expense', label: Text('Expenses')),
                ButtonSegment(value: 'reversed', label: Text('Reversed')),
              ],
              selected: {selectedFilter},
              onSelectionChanged: (selection) {
                setState(() => selectedFilter = selection.first);
              },
            ),
            const SizedBox(height: 12),

            ...transactions
                .where((item) {
                  if (selectedFilter == 'reversed') return item.isReversed;
                  if (selectedFilter == 'income') {
                    return !item.isReversed && item.transactionType == 'income';
                  }
                  if (selectedFilter == 'expense') {
                    return !item.isReversed &&
                        item.transactionType == 'expense';
                  }
                  return true;
                })
                .map(_transactionCard),

            if (transactions.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: Text('No transactions recorded yet.')),
                ),
              ),
          ],
        ],
      ],
    );
  }

  Widget _summaryCard(String title, double amount, Color color, IconData icon) {
    return SizedBox(
      width: 210,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 26),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 5),
              Text(
                money(amount),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactionCard(FinancialTransaction item) {
    final isIncome = item.transactionType == 'income';
    final color = item.isReversed
        ? Colors.grey
        : isIncome
        ? Colors.green.shade700
        : Colors.red.shade700;

    final date = item.transactionDate;

    return Card(
      margin: const EdgeInsets.only(bottom: 9),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.10),
          child: Icon(
            item.isReversed
                ? Icons.block
                : isIncome
                ? Icons.arrow_downward
                : Icons.arrow_upward,
            color: color,
          ),
        ),
        title: Text(
          item.category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: item.isReversed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${date.day.toString().padLeft(2, '0')}/'
              '${date.month.toString().padLeft(2, '0')}/'
              '${date.year}',
            ),
            if (item.description != null && item.description!.isNotEmpty)
              Text(item.description!),
            if (item.isReversed)
              Text(
                'REVERSED: ${item.reversalReason ?? ''}',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        isThreeLine: item.description != null || item.isReversed,
        trailing: SizedBox(
          width: 115,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                money(item.amount),
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
              if (!item.isReversed)
                TextButton(
                  onPressed: () => reverseTransaction(item),
                  child: const Text('Reverse', style: TextStyle(fontSize: 12)),
                )
              else
                const Text(
                  'Reversed',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
