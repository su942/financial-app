import 'package:flutter/material.dart';
import 'expense_detail_screen.dart';

class TipWidget extends StatelessWidget {
  const TipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => ExpenseDetailScreen())),
      child: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.lightbulb, color: Colors.amber),
              SizedBox(width: 12),
              Expanded(
                  child: Text(
                      'You spent 18% more on food last month. Tap for insights.')),
            ],
          ),
        ),
      ),
    );
  }
}
