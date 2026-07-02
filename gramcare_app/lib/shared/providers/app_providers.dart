import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale(AppConstants.langEnglish)) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(AppConstants.keyLanguage);
    if (langCode != null) {
      state = Locale(langCode);
    }
  }

  Future<void> setLocale(String langCode) async {
    if (!AppConstants.supportedLanguages.contains(langCode)) return;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.keyLanguage, langCode);
    state = Locale(langCode);
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.light) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('is_dark_mode') ?? false;
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = state == ThemeMode.dark;
    await prefs.setBool('is_dark_mode', !isDark);
    state = !isDark ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class FontScaleNotifier extends StateNotifier<double> {
  FontScaleNotifier() : super(AppConstants.defaultFontScale) {
    _loadFontScale();
  }

  Future<void> _loadFontScale() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getDouble(AppConstants.keyFontScale) ?? AppConstants.defaultFontScale;
  }

  Future<void> setFontScale(double scale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(AppConstants.keyFontScale, scale);
    state = scale;
  }
}

final fontScaleProvider = StateNotifierProvider<FontScaleNotifier, double>((ref) {
  return FontScaleNotifier();
});
