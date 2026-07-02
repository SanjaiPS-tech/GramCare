import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/elderly_theme_extensions.dart';
import 'core/router/app_router.dart';
import 'shared/providers/app_providers.dart';

class GramCareApp extends ConsumerWidget {
  const GramCareApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final fontScale = ref.watch(fontScaleProvider);

    return MaterialApp.router(
      title: 'GramCare',
      debugShowCheckedModeBanner: false,
      
      // Router
      routerConfig: router,
      
      // Localization
      locale: locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ta'),
        Locale('hi'),
        Locale('te'),
      ],
      
      // Theme
      themeMode: themeMode,
      theme: AppTheme.lightTheme(fontScale: fontScale).copyWith(
        extensions: [
          ElderlyThemeExtension(fontScale: fontScale),
        ],
      ),
      darkTheme: AppTheme.darkTheme(fontScale: fontScale).copyWith(
        extensions: [
          ElderlyThemeExtension(fontScale: fontScale),
        ],
      ),
    );
  }
}
