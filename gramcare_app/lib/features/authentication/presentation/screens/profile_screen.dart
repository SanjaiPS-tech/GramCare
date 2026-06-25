import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/elderly_button.dart';
import '../../../../shared/widgets/elderly_card.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.primarySurface,
              child: Icon(Icons.person, size: 80, color: AppColors.primary),
            ),
            const SizedBox(height: 24),
            Text(
              'User Profile',
              style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const ElderlyCard(
              child: ListTile(
                leading: Icon(Icons.phone, color: AppColors.primary, size: 30),
                title: Text('Phone Number'),
                subtitle: Text('+91 9876543210'), // Placeholder for now
              ),
            ),
            const SizedBox(height: 16),
            const ElderlyCard(
              child: ListTile(
                leading: Icon(Icons.language, color: AppColors.primary, size: 30),
                title: Text('Preferred Language'),
                subtitle: Text('English'),
              ),
            ),
            const SizedBox(height: 60),
            ElderlyButton(
              label: 'LOGOUT',
              isSecondary: true,
              icon: Icons.logout,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Logout?'),
                    content: const Text('Are you sure you want to exit?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('CANCEL')),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          authNotifier.logout();
                        },
                        child: const Text('LOGOUT', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
