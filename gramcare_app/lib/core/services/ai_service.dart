import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiService {
  final Dio _dio;
  final String _apiKey;
  static const String _baseUrl = 'https://integrate.api.nvidia.com/v1/chat/completions';
  static const String _model = 'meta/llama-3.1-405b-instruct';

  AiService(this._apiKey) : _dio = Dio();

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

    try {
      final response = await _dio.post(
        _baseUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "model": _model,
          "messages": [
            {"role": "user", "content": prompt}
          ],
          "temperature": 0.2,
          "top_p": 0.7,
          "max_tokens": 1024,
        },
      );

      if (response.statusCode == 200) {
        return response.data['choices'][0]['message']['content'];
      } else {
        return "Error from AI service: ${response.statusCode}";
      }
    } catch (e) {
      return "I couldn't analyze the prescription today. Please consult your doctor directly.";
    }
  }
}

final aiServiceProvider = Provider<AiService>((ref) {
  const apiKey = String.fromEnvironment('NVIDIA_API_KEY');
  return AiService(apiKey);
});
