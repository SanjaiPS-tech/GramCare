import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceService {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();

  Future<void> init() async {
    await _speechToText.initialize();
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.4); // Slower for elderly
    await _flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  void startListening(Function(String) onResult) async {
    await _speechToText.listen(
      onResult: (result) => onResult(result.recognizedWords),
    );
  }

  void stopListening() async {
    await _speechToText.stop();
  }

  bool get isListening => _speechToText.isListening;
}

final voiceServiceProvider = Provider<VoiceService>((ref) {
  return VoiceService();
});
