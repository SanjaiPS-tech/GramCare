import 'dart:io';
import 'package:flutter_riverpod/legacy.dart';
import 'package:state_notifier/state_notifier.dart';
import '../../../../core/services/ocr_service.dart';
import '../../../../core/services/ai_service.dart';
import 'prescription_state.dart';
import '../../domain/entities/prescription_entity.dart';
import 'package:uuid/uuid.dart';

class PrescriptionNotifier extends StateNotifier<PrescriptionState> {
  final OcrService _ocrService;
  final AiService _aiService;

  PrescriptionNotifier({
    required OcrService ocrService,
    required AiService aiService,
  })  : _ocrService = ocrService,
        _aiService = aiService,
        super(const PrescriptionState.initial());

  Future<void> processPrescription(String imagePath, String language) async {
    state = const PrescriptionState.loading();
    try {
      // 1. OCR
      final text = await _ocrService.recognizeText(imagePath);
      
      // 2. AI Explanation
      final explanation = await _aiService.explainPrescription(text, language);
      
      final prescription = PrescriptionEntity(
        id: const Uuid().v4(),
        userId: 'current_user_id',
        imagePath: imagePath,
        ocrText: text,
        aiExplanation: explanation,
        language: language,
        prescribedDate: DateTime.now(),
      );
      
      state = PrescriptionState.success(prescription);
    } catch (e) {
      state = PrescriptionState.error(e.toString());
    }
  }
}

final prescriptionNotifierProvider = StateNotifierProvider<PrescriptionNotifier, PrescriptionState>((ref) {
  return PrescriptionNotifier(
    ocrService: ref.read(ocrServiceProvider),
    aiService: ref.read(aiServiceProvider),
  );
});
