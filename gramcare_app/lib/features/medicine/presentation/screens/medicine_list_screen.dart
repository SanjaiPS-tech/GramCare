import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/elderly_button.dart';
import '../../../../shared/widgets/elderly_card.dart';
import '../providers/medicine_provider.dart';
import '../../domain/entities/medicine_entity.dart';

class MedicineListScreen extends ConsumerWidget {
  const MedicineListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicineState = ref.watch(medicineNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Medicines'),
      ),
      body: medicineState.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $message'),
              const SizedBox(height: 16),
              ElderlyButton(
                label: 'Retry',
                onPressed: () => ref.read(medicineNotifierProvider.notifier).getMedicines(),
              ),
            ],
          ),
        ),
        loaded: (medicines) {
          if (medicines.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.medication_liquid, size: 80, color: AppColors.textTertiary),
                  const SizedBox(height: 16),
                  Text(
                    'No medicines added yet',
                    style: context.textTheme.titleLarge?.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              final medicine = medicines[index];
              return _MedicineListItem(medicine: medicine);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => context.push('/medicines/add'),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _MedicineListItem extends StatelessWidget {
  final MedicineEntity medicine;

  const _MedicineListItem({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return ElderlyCard(
      onTap: () {
        // Navigate to details or edit
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.medication, color: AppColors.primary, size: 40),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name,
                      style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${medicine.dosage} • ${medicine.timing}',
                      style: context.textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textTertiary),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Frequency: ${medicine.frequency}',
            style: context.textTheme.bodyLarge,
          ),
          if (medicine.instructions != null)
            Padding(
              padding: const EdgeInsets.top(4),
              child: Text(
                'Instructions: ${medicine.instructions}',
                style: context.textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
        ],
      ),
    );
  }
}
