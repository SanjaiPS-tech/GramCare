import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/elderly_card.dart';
import '../../../../shared/widgets/elderly_button.dart';

class TelemedicineScreen extends StatelessWidget {
  const TelemedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consult a Doctor'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'Nearby Doctors',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _DoctorCard(
            name: 'Dr. Anita Sharma',
            specialization: 'General Physician',
            experience: '15 years',
            availability: 'Online Now',
            imageColor: Colors.blue,
          ),
          const SizedBox(height: 16),
          _DoctorCard(
            name: 'Dr. Vijay Kumar',
            specialization: 'Cardiologist',
            experience: '20 years',
            availability: 'Available tomorrow',
            imageColor: Colors.green,
          ),
          const SizedBox(height: 40),
          ElderlyButton(
            label: 'VIEW ALL DOCTORS',
            isSecondary: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String experience;
  final String availability;
  final Color imageColor;

  const _DoctorCard({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.availability,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElderlyCard(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: imageColor.withOpacity(0.2),
              child: Icon(Icons.person, color: imageColor, size: 40),
            ),
            title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            subtitle: Text('$specialization\n$experience exp.'),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(availability, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  child: const Text('Book', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
