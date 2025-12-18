import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/transaction_model.dart';

class ExpenseChart extends StatelessWidget {
  final List<Transaction> transactions;

  const ExpenseChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty)
      return const Center(
          child: Text("No data", style: TextStyle(color: Colors.white)));

    // Simple logic: Group by day or category (mocking category by iconDetails for now)
    // For this prototype, let's show a fake weekly trend based on amount
    return AspectRatio(
      aspectRatio: 1.70,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 18, left: 12, top: 24, bottom: 12),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              show: true,
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return Text('Day ${value.toInt()}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12));
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 100, // Dynamic max logic needed in real app
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 30),
                  const FlSpot(1, 50),
                  const FlSpot(2, 20),
                  const FlSpot(3, 80),
                  const FlSpot(4, 40),
                  const FlSpot(5, 90),
                  const FlSpot(6, 60),
                ],
                isCurved: true,
                color: AppColors.accent,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: AppColors.accent.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
