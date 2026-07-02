import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/elderly_button.dart';
import '../../../../shared/widgets/elderly_card.dart';
import '../providers/prescription_provider.dart';

class PrescriptionAnalysisScreen extends ConsumerStatefulWidget {
  const PrescriptionAnalysisScreen({super.key});

  @override
  ConsumerState<PrescriptionAnalysisScreen> createState() => _PrescriptionAnalysisScreenState();
}

class _PrescriptionAnalysisScreenState extends ConsumerState<PrescriptionAnalysisScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? selected = await _picker.pickImage(source: source);
    if (selected != null) {
      setState(() => _image = selected);
      ref.read(prescriptionNotifierProvider.notifier).processPrescription(selected.path, 'English');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(prescriptionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analyze Prescription'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_image == null)
              Column(
                children: [
                  const Icon(Icons.camera_alt, size: 100, color: AppColors.textTertiary),
                  const SizedBox(height: 24),
                  Text(
                    'Take a clear photo of your prescription',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 40),
                  ElderlyButton(
                    label: 'TAKE PHOTO',
                    icon: Icons.camera_alt,
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  const SizedBox(height: 16),
                  ElderlyButton(
                    label: 'UPLOAD FROM GALLERY',
                    isSecondary: true,
                    icon: Icons.photo_library,
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              )
            else
              state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 24),
                      Text('Reading prescription...'),
                      Text('Gemini AI is analyzing...'),
                    ],
                  ),
                ),
                error: (message) => Center(child: Text('Error: $message')),
                success: (prescription) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(_image!.path),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'AI Explanation',
                      style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    const SizedBox(height: 16),
                    ElderlyCard(
                      child: Text(
                        prescription.aiExplanation ?? 'No explanation available',
                        style: context.textTheme.titleMedium?.copyWith(height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElderlyButton(
                      label: 'DONE',
                      onPressed: () => context.pop(),
                    ),
                    const SizedBox(height: 16),
                    ElderlyButton(
                      label: 'RETAKE PHOTO',
                      isSecondary: true,
                      onPressed: () => setState(() => _image = null),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
