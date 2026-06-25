import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Theme extension for elderly-specific sizing and accessibility settings.
class ElderlyThemeExtension extends ThemeExtension<ElderlyThemeExtension> {
  final double fontScale;
  final bool highContrast;
  final double buttonHeight;
  final double iconSize;
  final double padding;
  final double borderRadius;
  final double borderWidth;
  final Duration animationDuration;

  const ElderlyThemeExtension({
    this.fontScale = AppConstants.defaultFontScale,
    this.highContrast = false,
    this.buttonHeight = AppConstants.elderlyButtonHeight,
    this.iconSize = AppConstants.elderlyIconSize,
    this.padding = AppConstants.elderlyPadding,
    this.borderRadius = AppConstants.elderlyBorderRadius,
    this.borderWidth = 2.0,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  ElderlyThemeExtension copyWith({
    double? fontScale,
    bool? highContrast,
    double? buttonHeight,
    double? iconSize,
    double? padding,
    double? borderRadius,
    double? borderWidth,
    Duration? animationDuration,
  }) {
    return ElderlyThemeExtension(
      fontScale: fontScale ?? this.fontScale,
      highContrast: highContrast ?? this.highContrast,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      iconSize: iconSize ?? this.iconSize,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }

  @override
  ElderlyThemeExtension lerp(
      covariant ThemeExtension<ElderlyThemeExtension>? other, double t) {
    if (other is! ElderlyThemeExtension) return this;
    return ElderlyThemeExtension(
      fontScale: lerpDouble(fontScale, other.fontScale, t) ?? fontScale,
      highContrast: t < 0.5 ? highContrast : other.highContrast,
      buttonHeight:
          lerpDouble(buttonHeight, other.buttonHeight, t) ?? buttonHeight,
      iconSize: lerpDouble(iconSize, other.iconSize, t) ?? iconSize,
      padding: lerpDouble(padding, other.padding, t) ?? padding,
      borderRadius:
          lerpDouble(borderRadius, other.borderRadius, t) ?? borderRadius,
      borderWidth:
          lerpDouble(borderWidth, other.borderWidth, t) ?? borderWidth,
      animationDuration: t < 0.5
          ? animationDuration
          : other.animationDuration,
    );
  }

  static double? lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    a ??= 0.0;
    b ??= 0.0;
    return a + (b - a) * t;
  }

  /// Helper to get the extension from context
  static ElderlyThemeExtension of(BuildContext context) {
    return Theme.of(context).extension<ElderlyThemeExtension>() ??
        const ElderlyThemeExtension();
  }
}
