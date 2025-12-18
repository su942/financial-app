import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/providers/wallet_provider.dart';
import 'widgets/credit_card_widget.dart';
import 'widgets/action_button.dart';
import 'widgets/transaction_list.dart';
import 'add_transaction_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good morning,',
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                      Text('Suraj',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.cardBg,
                      child: Icon(Icons.person, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 24),
              // Card
              Consumer<WalletProvider>(
                builder: (context, wallet, _) =>
                    CreditCardWidget(balance: wallet.balance),
              ),
              const SizedBox(height: 24),
              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(
                    icon: Icons.arrow_upward,
                    label: 'Send', // Treat as Expense
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const AddTransactionScreen(isIncome: false))),
                  ),
                  ActionButton(
                    icon: Icons.arrow_downward,
                    label: 'Receive', // Treat as Income
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const AddTransactionScreen(isIncome: true))),
                  ),
                  ActionButton(
                    icon: Icons.add,
                    label: 'Top-up', // Treat as Income
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const AddTransactionScreen(isIncome: true))),
                  ),
                  ActionButton(
                    icon: Icons.remove_circle_outline,
                    label: 'Expense', // Treat as Expense
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const AddTransactionScreen(isIncome: false))),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Transactions
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Transactions',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('See All', style: TextStyle(color: AppColors.accent)),
                ],
              ),
              const SizedBox(height: 16),
              Consumer<WalletProvider>(
                  builder: (context, wallet, _) =>
                      TransactionList(transactions: wallet.transactions)),
            ],
          ),
        ),
      ),
    );
  }
}
