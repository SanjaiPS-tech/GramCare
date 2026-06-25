import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// GramCare theme system with elderly-friendly defaults, dark mode, and high contrast support.
class AppTheme {
  AppTheme._();

  /// Light theme (default)
  static ThemeData lightTheme({double fontScale = 1.0}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.textOnPrimary,
        primaryContainer: AppColors.primarySurface,
        secondary: AppColors.secondary,
        onSecondary: AppColors.textOnSecondary,
        secondaryContainer: AppColors.secondarySurface,
        tertiary: AppColors.accent,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        error: AppColors.error,
        onError: AppColors.textOnPrimary,
        outline: AppColors.border,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headlineSmall(scale: fontScale).copyWith(
          color: AppColors.textPrimary,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textPrimary,
          size: 28,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 2,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          minimumSize: const Size(double.infinity, 60),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.elderlyButton(scale: fontScale),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, 60),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.elderlyButton(scale: fontScale),
          side: const BorderSide(color: AppColors.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.labelLarge(scale: fontScale),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintStyle: AppTextStyles.bodyMedium(scale: fontScale).copyWith(
          color: AppColors.textTertiary,
        ),
        labelStyle: AppTextStyles.bodyMedium(scale: fontScale).copyWith(
          color: AppColors.textSecondary,
        ),
        errorStyle: AppTextStyles.bodySmall(scale: fontScale).copyWith(
          color: AppColors.error,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 2.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error, width: 2.5),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 6,
        shape: CircleBorder(),
        sizeConstraints: BoxConstraints.tightFor(width: 72, height: 72),
        iconSize: 32,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textTertiary,
        selectedLabelStyle: AppTextStyles.labelMedium(scale: fontScale),
        unselectedLabelStyle: AppTextStyles.labelSmall(scale: fontScale),
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 26),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentTextStyle: AppTextStyles.bodyMedium(scale: fontScale).copyWith(
          color: Colors.white,
        ),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: AppTextStyles.headlineSmall(scale: fontScale).copyWith(
          color: AppColors.textPrimary,
        ),
        contentTextStyle: AppTextStyles.bodyLarge(scale: fontScale).copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariant,
        selectedColor: AppColors.primarySurface,
        labelStyle: AppTextStyles.labelMedium(scale: fontScale),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge(scale: fontScale),
        displayMedium: AppTextStyles.displayMedium(scale: fontScale),
        headlineLarge: AppTextStyles.headlineLarge(scale: fontScale),
        headlineMedium: AppTextStyles.headlineMedium(scale: fontScale),
        headlineSmall: AppTextStyles.headlineSmall(scale: fontScale),
        titleLarge: AppTextStyles.titleLarge(scale: fontScale),
        titleMedium: AppTextStyles.titleMedium(scale: fontScale),
        titleSmall: AppTextStyles.titleSmall(scale: fontScale),
        bodyLarge: AppTextStyles.bodyLarge(scale: fontScale),
        bodyMedium: AppTextStyles.bodyMedium(scale: fontScale),
        bodySmall: AppTextStyles.bodySmall(scale: fontScale),
        labelLarge: AppTextStyles.labelLarge(scale: fontScale),
        labelMedium: AppTextStyles.labelMedium(scale: fontScale),
        labelSmall: AppTextStyles.labelSmall(scale: fontScale),
      ),
    );
  }

  /// Dark theme
  static ThemeData darkTheme({double fontScale = 1.0}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLight,
        onPrimary: AppColors.darkBackground,
        primaryContainer: AppColors.primaryDark,
        secondary: AppColors.secondaryLight,
        onSecondary: AppColors.darkBackground,
        tertiary: AppColors.accentLight,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkTextPrimary,
        error: AppColors.error,
        onError: AppColors.textOnPrimary,
        outline: AppColors.darkBorder,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headlineSmall(scale: fontScale).copyWith(
          color: AppColors.darkTextPrimary,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.darkTextPrimary,
          size: 28,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkCardBackground,
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.darkBackground,
          minimumSize: const Size(double.infinity, 60),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.elderlyButton(scale: fontScale),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurfaceVariant,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintStyle: AppTextStyles.bodyMedium(scale: fontScale).copyWith(
          color: AppColors.darkTextSecondary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              const BorderSide(color: AppColors.primaryLight, width: 2.5),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        displayMedium: AppTextStyles.displayMedium(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        headlineLarge: AppTextStyles.headlineLarge(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        headlineMedium: AppTextStyles.headlineMedium(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        headlineSmall: AppTextStyles.headlineSmall(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        titleLarge: AppTextStyles.titleLarge(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        titleMedium: AppTextStyles.titleMedium(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        titleSmall: AppTextStyles.titleSmall(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        bodyLarge: AppTextStyles.bodyLarge(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        bodyMedium: AppTextStyles.bodyMedium(scale: fontScale)
            .copyWith(color: AppColors.darkTextSecondary),
        bodySmall: AppTextStyles.bodySmall(scale: fontScale)
            .copyWith(color: AppColors.darkTextSecondary),
        labelLarge: AppTextStyles.labelLarge(scale: fontScale)
            .copyWith(color: AppColors.darkTextPrimary),
        labelMedium: AppTextStyles.labelMedium(scale: fontScale)
            .copyWith(color: AppColors.darkTextSecondary),
        labelSmall: AppTextStyles.labelSmall(scale: fontScale)
            .copyWith(color: AppColors.darkTextSecondary),
      ),
    );
  }

  /// High contrast theme for visually impaired elderly users
  static ThemeData highContrastTheme({double fontScale = 1.0}) {
    final base = lightTheme(fontScale: fontScale);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.hcBackground,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.hcPrimary,
        onPrimary: Colors.white,
        surface: AppColors.hcBackground,
        onSurface: AppColors.hcTextPrimary,
        error: AppColors.hcError,
        outline: AppColors.hcBorder,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.hcPrimary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 64),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          textStyle: AppTextStyles.elderlyButton(scale: fontScale * 1.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.hcBorder, width: 3),
          ),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.hcBorder, width: 3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.hcBorder, width: 3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.hcPrimary, width: 4),
        ),
      ),
    );
  }
}
