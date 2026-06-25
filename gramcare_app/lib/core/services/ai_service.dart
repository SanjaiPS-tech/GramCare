import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiService {
  final GenerativeModel _model;

  AiService(String apiKey)
      : _model = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: apiKey,
        );

  Future<String> explainPrescription(String ocrText, String language) async {
    final prompt = '''
    The following is text extracted from a medical prescription:
    "$ocrText"

    Please provide a simple, elderly-friendly explanation of this prescription in $language.
    Include:
    1. The names of the medicines.
    2. What each medicine is for (in simple terms).
    3. How and when to take them.
    4. Any important warnings.

    Keep the tone caring and easy to understand. Avoid medical jargon.
    ''';

    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    return response.text ?? "I couldn't analyze the prescription. Please consult your doctor.";
  }
}

final aiServiceProvider = Provider<AiService>((ref) {
  // In a real app, get the API key from a secure config
  const apiKey = String.fromEnvironment('GEMINI_API_KEY');
  return AiService(apiKey);
});
