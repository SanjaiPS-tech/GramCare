import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/elderly_card.dart';

class HealthRecordsScreen extends ConsumerWidget {
  const HealthRecordsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Health Records'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _RecordItem(
            title: 'Blood Pressure Report',
            date: '20 Jun 2025',
            type: 'Lab Result',
            icon: Icons.biotech,
          ),
          _RecordItem(
            title: 'Diabetes Checkup',
            date: '15 Jun 2025',
            type: 'Doctor Visit',
            icon: Icons.person,
          ),
          _RecordItem(
            title: 'X-Ray Chest',
            date: '10 May 2025',
            type: 'Radiology',
            icon: Icons.visibility,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_photo_alternate, color: Colors.white),
      ),
    );
  }
}

class _RecordItem extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final IconData icon;

  const _RecordItem({
    required this.title,
    required this.date,
    required this.type,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElderlyCard(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primarySurface,
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        subtitle: Text('$type • $date'),
        trailing: const Icon(Icons.file_download, color: AppColors.primary),
      ),
    );
  }
}
