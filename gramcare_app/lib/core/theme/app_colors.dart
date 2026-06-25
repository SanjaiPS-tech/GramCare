import 'package:flutter/material.dart';

/// Color palette designed for elderly users with high contrast and accessibility.
class AppColors {
  AppColors._();

  // Primary Palette - Warm Teal (calming, healthcare)
  static const Color primary = Color(0xFF00897B);
  static const Color primaryLight = Color(0xFF4DB6AC);
  static const Color primaryDark = Color(0xFF00695C);
  static const Color primarySurface = Color(0xFFE0F2F1);

  // Secondary Palette - Warm Orange (energy, warmth)
  static const Color secondary = Color(0xFFFF8F00);
  static const Color secondaryLight = Color(0xFFFFB74D);
  static const Color secondaryDark = Color(0xFFE65100);
  static const Color secondarySurface = Color(0xFFFFF3E0);

  // Accent - Soft Blue (trust)
  static const Color accent = Color(0xFF1976D2);
  static const Color accentLight = Color(0xFF64B5F6);
  static const Color accentSurface = Color(0xFFE3F2FD);

  // Background & Surface
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF0F2F5);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors - High contrast for elderly visibility
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF4A4A6A);
  static const Color textTertiary = Color(0xFF8A8AA0);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  // Status Colors - Highly distinguishable
  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFFE8F5E9);
  static const Color warning = Color(0xFFF57F17);
  static const Color warningLight = Color(0xFFFFF9C4);
  static const Color error = Color(0xFFC62828);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color info = Color(0xFF1565C0);
  static const Color infoLight = Color(0xFFE3F2FD);

  // Risk Level Colors
  static const Color riskLow = Color(0xFF4CAF50);
  static const Color riskMedium = Color(0xFFFF9800);
  static const Color riskHigh = Color(0xFFF44336);
  static const Color riskCritical = Color(0xFF9C27B0);

  // Medicine Status Colors
  static const Color taken = Color(0xFF2E7D32);
  static const Color missed = Color(0xFFC62828);
  static const Color skipped = Color(0xFFFF8F00);

  // Borders and Dividers
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFF0F0F0);

  // Shadows
  static const Color shadow = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // Emergency
  static const Color emergency = Color(0xFFD32F2F);
  static const Color emergencyPulse = Color(0xFFFF5252);

  // Offline Indicator
  static const Color offline = Color(0xFF757575);
  static const Color online = Color(0xFF4CAF50);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E2E);
  static const Color darkSurfaceVariant = Color(0xFF2A2A3E);
  static const Color darkCardBackground = Color(0xFF252540);
  static const Color darkTextPrimary = Color(0xFFE8E8F0);
  static const Color darkTextSecondary = Color(0xFFB0B0C0);
  static const Color darkBorder = Color(0xFF3A3A50);

  // High Contrast Mode Colors
  static const Color hcBackground = Color(0xFFFFFFFF);
  static const Color hcTextPrimary = Color(0xFF000000);
  static const Color hcPrimary = Color(0xFF004D40);
  static const Color hcError = Color(0xFF8B0000);
  static const Color hcSuccess = Color(0xFF006400);
  static const Color hcBorder = Color(0xFF000000);
}
