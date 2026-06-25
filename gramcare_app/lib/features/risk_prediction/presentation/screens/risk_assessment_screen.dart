import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/elderly_card.dart';

class RiskAssessmentScreen extends ConsumerWidget {
  const RiskAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Health Risk Analysis'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ElderlyCard(
              color: Colors.orangeAccent,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'HIGH RISK',
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Potential Hypertension Issue',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'AI Recommendations',
              style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const _RecommendationItem(
              icon: Icons.water_drop,
              text: 'Reduce salt intake in your diet.',
            ),
            const _RecommendationItem(
              icon: Icons.directions_walk,
              text: 'Continue daily 20-minute morning walks.',
            ),
             const _RecommendationItem(
              icon: Icons.medical_services,
              text: 'Schedule a checkup with Dr. Anita this week.',
            ),
             const SizedBox(height: 40),
             const ElderlyCard(
               child: ListTile(
                 title: Text('Data Sources Analyzed'),
                 subtitle: Text('Medicine logs (30 days), Health records, Family history'),
                 trailing: Icon(Icons.info_outline),
               ),
             ),
          ],
        ),
      ),
    );
  }
}

class _RecommendationItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _RecommendationItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}
