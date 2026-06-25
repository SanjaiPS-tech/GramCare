import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/elderly_card.dart';

class FamilyDashboardScreen extends ConsumerWidget {
  const FamilyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Health Adherence',
              style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(value: 85, color: Colors.green, title: '85%', radius: 60, titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    PieChartSectionData(value: 10, color: Colors.red, title: '10%', radius: 50, titleStyle: const TextStyle(color: Colors.white)),
                    PieChartSectionData(value: 5, color: Colors.orange, title: '5%', radius: 40, titleStyle: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _LegendItem(color: Colors.green, label: 'Taken'),
                const SizedBox(width: 16),
                _LegendItem(color: Colors.red, label: 'Missed'),
                const SizedBox(width: 16),
                _LegendItem(color: Colors.orange, label: 'Skipped'),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'Recent Activity',
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const _ActivityItem(
              title: 'Morning Medicines',
              status: 'Completed',
              time: '9:30 AM',
              color: Colors.green,
            ),
             const _ActivityItem(
              title: 'Walk (20 mins)',
              status: 'Completed',
              time: '7:00 AM',
              color: Colors.green,
            ),
             const _ActivityItem(
              title: 'Blood Sugar Test',
              status: 'Pending',
              time: 'Before Dinner',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final String title;
  final String status;
  final String time;
  final Color color;

  const _ActivityItem({
    required this.title,
    required this.status,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElderlyCard(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Status: $status'),
        trailing: Text(time, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
