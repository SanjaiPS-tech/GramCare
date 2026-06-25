import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography system designed for elderly users with large, readable fonts.
class AppTextStyles {
  AppTextStyles._();

  static const double _baseScale = 1.0;

  // Font Family
  static String get _fontFamily => GoogleFonts.inter().fontFamily ?? 'Inter';

  // Display Styles - For hero text
  static TextStyle displayLarge({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 40 * scale,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.5,
      );

  static TextStyle displayMedium({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 34 * scale,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.25,
      );

  // Headline Styles - For screen titles
  static TextStyle headlineLarge({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28 * scale,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  static TextStyle headlineMedium({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24 * scale,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  static TextStyle headlineSmall({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20 * scale,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  // Title Styles - For section headers and cards
  static TextStyle titleLarge({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20 * scale,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle titleMedium({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18 * scale,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  static TextStyle titleSmall({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16 * scale,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  // Body Styles - For content (larger than standard for elderly)
  static TextStyle bodyLarge({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18 * scale,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle bodyMedium({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16 * scale,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle bodySmall({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14 * scale,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  // Label Styles - For buttons, chips, tabs
  static TextStyle labelLarge({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16 * scale,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: 0.5,
      );

  static TextStyle labelMedium({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14 * scale,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.5,
      );

  static TextStyle labelSmall({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12 * scale,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.5,
      );

  // Elderly-specific styles
  static TextStyle elderlyButton({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20 * scale,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 0.5,
      );

  static TextStyle elderlyMedicineName({double scale = _baseScale}) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22 * scale,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  static TextStyle elderlyTime({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 36 * scale,
        fontWeight: FontWeight.w700,
        height: 1.2,
      );

  static TextStyle elderlySOSButton({double scale = _baseScale}) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28 * scale,
        fontWeight: FontWeight.w800,
        height: 1.2,
        letterSpacing: 1.0,
      );
}
