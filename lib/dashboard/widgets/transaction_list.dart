import 'package:flutter/material.dart';
import '../../models/transaction_model.dart';
import '../../core/theme/app_theme.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'coffee':
        return Icons.coffee;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'attach_money':
        return Icons.attach_money;
      case 'movie':
        return Icons.movie;
      case 'fastfood':
        return Icons.fastfood;
      default:
        return Icons.money_off;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_getIcon(tx.iconDetails),
                    color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tx.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(tx.date,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              Text(
                '${tx.isIncome ? '+' : '-'}\$${tx.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: tx.isIncome ? AppColors.accent : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
