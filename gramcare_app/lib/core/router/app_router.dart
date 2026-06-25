import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/register_screen.dart';

// Placeholder screens - will be updated as features are built
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const PlaceholderScreen(title: 'Home Dashboard'),
        routes: [
          GoRoute(
            path: 'medicines',
            builder: (context, state) => const PlaceholderScreen(title: 'Medicines'),
          ),
          GoRoute(
            path: 'prescriptions',
            builder: (context, state) => const PlaceholderScreen(title: 'Prescriptions'),
          ),
          GoRoute(
            path: 'emergency',
            builder: (context, state) => const PlaceholderScreen(title: 'Emergency'),
          ),
          GoRoute(
            path: 'health-records',
            builder: (context, state) => const PlaceholderScreen(title: 'Health Records'),
          ),
          GoRoute(
            path: 'family',
            builder: (context, state) => const PlaceholderScreen(title: 'Family Dashboard'),
          ),
          GoRoute(
            path: 'telemedicine',
            builder: (context, state) => const PlaceholderScreen(title: 'Telemedicine'),
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) => const PlaceholderScreen(title: 'Settings'),
          ),
        ],
      ),
    ],
  );
});
