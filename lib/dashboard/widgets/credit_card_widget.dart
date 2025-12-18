import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class CreditCardWidget extends StatelessWidget {
  final double balance;

  const CreditCardWidget({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: AppColors.accent, // Simplified for now, can be gradient
          borderRadius: BorderRadius.circular(24),
          image: const DecorationImage(
            image: AssetImage('assets/images/card_pattern.png'), // Placeholder
            fit: BoxFit.cover,
            opacity: 0.2, // Subtle pattern
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Antigravity',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              Icon(Icons.contactless, color: Colors.black),
            ],
          ),
          const Spacer(),
          const Text('Balance', style: TextStyle(color: Colors.black54)),
          Text(
            '\$${balance.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('**** **** **** 4568',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontFamily: 'monospace')),
              Text('12/25',
                  style: TextStyle(color: Colors.black87, fontSize: 16)),
            ],
          )
        ],
      ),
    );
  }
}
