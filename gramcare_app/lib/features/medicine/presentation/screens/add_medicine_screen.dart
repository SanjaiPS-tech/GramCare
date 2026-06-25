import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/elderly_button.dart';
import '../../../../shared/widgets/elderly_text_field.dart';
import '../providers/medicine_provider.dart';
import '../../domain/entities/medicine_entity.dart';

class AddMedicineScreen extends ConsumerStatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  ConsumerState<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends ConsumerState<AddMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _instructionsController = TextEditingController();
  
  String _frequency = 'Daily';
  String _timing = 'After Meal';
  DateTime _startDate = DateTime.now();

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final medicine = MedicineEntity(
        id: const Uuid().v4(),
        userId: 'current_user_id', // Placeholder
        name: _nameController.text.trim(),
        dosage: _dosageController.text.trim(),
        frequency: _frequency,
        timing: _timing,
        startDate: _startDate,
        instructions: _instructionsController.text.trim().isEmpty ? null : _instructionsController.text.trim(),
        isActive: true,
      );

      ref.read(medicineNotifierProvider.notifier).addMedicine(medicine);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicine'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElderlyTextField(
                label: 'Medicine Name',
                hint: 'e.g. Paracetamol',
                controller: _nameController,
                prefixIcon: Icons.medication,
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              ElderlyTextField(
                label: 'Dosage',
                hint: 'e.g. 500mg, 1 tablet',
                controller: _dosageController,
                prefixIcon: Icons.scale,
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              Text('Frequency', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _frequency,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: ['Daily', 'Twice a day', 'Thrice a day', 'Weekly']
                    .map((f) => DropdownMenuItem(value: f, child: Text(f, style: const TextStyle(fontSize: 20))))
                    .toList(),
                onChanged: (val) => setState(() => _frequency = val!),
              ),
              const SizedBox(height: 24),
              Text('Timing', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _timing,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: ['Before Meal', 'After Meal', 'Empty Stomach']
                    .map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(fontSize: 20))))
                    .toList(),
                onChanged: (val) => setState(() => _timing = val!),
              ),
              const SizedBox(height: 24),
              ElderlyTextField(
                label: 'Special Instructions',
                hint: 'e.g. Avoid dairy',
                controller: _instructionsController,
                prefixIcon: Icons.info_outline,
                maxLines: 2,
              ),
              const SizedBox(height: 40),
              ElderlyButton(
                label: 'SAVE MEDICINE',
                onPressed: _onSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
