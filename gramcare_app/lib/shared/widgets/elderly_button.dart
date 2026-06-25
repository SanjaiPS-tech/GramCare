import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/elderly_theme_extensions.dart';

class ElderlyButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isSecondary;
  final bool isEmergency;
  final bool isLoading;
  final double? width;

  const ElderlyButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isSecondary = false,
    this.isEmergency = false,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final elderlyTheme = ElderlyThemeExtension.of(context);
    final theme = Theme.of(context);

    Color backgroundColor = isSecondary ? theme.colorScheme.secondary : theme.colorScheme.primary;
    if (isEmergency) backgroundColor = AppColors.emergency;
    if (onPressed == null) backgroundColor = theme.disabledColor;

    return SizedBox(
      width: width ?? double.infinity,
      height: elderlyTheme.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          elevation: isEmergency ? 8 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(elderlyTheme.borderRadius),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: elderlyTheme.iconSize),
                    const SizedBox(width: 12),
                  ],
                  Text(
                    label,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 20 * elderlyTheme.fontScale,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
