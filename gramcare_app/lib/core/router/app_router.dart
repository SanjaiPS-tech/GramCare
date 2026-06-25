import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/register_screen.dart';
import '../../features/medicine/presentation/screens/medicine_list_screen.dart';
import '../../features/medicine/presentation/screens/add_medicine_screen.dart';
import '../../features/prescription/presentation/screens/prescription_analysis_screen.dart';
import '../../features/emergency/presentation/screens/emergency_screen.dart';
import '../../features/health_records/presentation/screens/health_records_screen.dart';
import '../../features/family_dashboard/presentation/screens/family_dashboard_screen.dart';
import '../../features/telemedicine/presentation/screens/telemedicine_screen.dart';
import '../../features/risk_prediction/presentation/screens/risk_assessment_screen.dart';





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
            builder: (context, state) => const MedicineListScreen(),
            routes: [
              GoRoute(
                path: 'add',
                builder: (context, state) => const AddMedicineScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'prescriptions',
            builder: (context, state) => const PrescriptionAnalysisScreen(),
          ),
          GoRoute(
            path: 'emergency',
            builder: (context, state) => const EmergencyScreen(),
          ),
          GoRoute(
            path: 'health-records',
            builder: (context, state) => const HealthRecordsScreen(),
          ),
          GoRoute(
            path: 'family',
            builder: (context, state) => const FamilyDashboardScreen(),
          ),
          GoRoute(
            path: 'telemedicine',
            builder: (context, state) => const TelemedicineScreen(),
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) => const PlaceholderScreen(title: 'Settings'),
          ),
          GoRoute(
            path: 'risk',
            builder: (context, state) => const RiskAssessmentScreen(),
          ),
        ],
      ),
    ],
  );
});
