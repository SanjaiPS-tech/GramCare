import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/asset_paths.dart';
import '../../core/theme/app_colors.dart';

class VoiceInputButton extends StatefulWidget {
  final Function(String) onResult;
  final bool isListening;
  final VoidCallback? onStart;
  final VoidCallback? onStop;

  const VoiceInputButton({
    super.key,
    required this.onResult,
    this.isListening = false,
    this.onStart,
    this.onStop,
  });

  @override
  State<VoiceInputButton> createState() => _VoiceInputButtonState();
}

class _VoiceInputButtonState extends State<VoiceInputButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isListening ? widget.onStop : widget.onStart,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: widget.isListening ? AppColors.secondary : AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: (widget.isListening ? AppColors.secondary : AppColors.primary)
                  .withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: widget.isListening
            ? Center(
                child: Lottie.asset(
                  AssetPaths.lottieVoice,
                  width: 50,
                  height: 50,
                ),
              )
            : const Icon(
                Icons.mic,
                color: Colors.white,
                size: 40,
              ),
      ),
    );
  }
}
