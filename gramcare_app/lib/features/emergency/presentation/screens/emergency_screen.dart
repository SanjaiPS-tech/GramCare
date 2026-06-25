import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/elderly_button.dart';
import '../../../../shared/widgets/elderly_card.dart';

class EmergencyScreen extends ConsumerWidget {
  const EmergencyScreen({super.key});

  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Assistance'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                // Trigger SOS logic (SMS + GPS)
              },
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.redAccent, blurRadius: 20, spreadRadius: 5),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'SOS',
                    style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Press the button above for 3 seconds to alert your family and local health worker.',
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),
            Text(
              'Quick Call',
              style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElderlyCard(
              color: Colors.blue.shade50,
              onTap: () => _makeCall('108'),
              child: const ListTile(
                leading: Icon(Icons.emergency, color: Colors.blue, size: 40),
                title: Text('Ambulance (108)'),
                trailing: Icon(Icons.phone, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 16),
            ElderlyCard(
              color: Colors.green.shade50,
              onTap: () => _makeCall('9876543210'), // Mock Family Contact
              child: const ListTile(
                leading: Icon(Icons.family_restroom, color: Colors.green, size: 40),
                title: Text('Family Contact'),
                subtitle: Text('Ramesh (Son)'),
                trailing: Icon(Icons.phone, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
