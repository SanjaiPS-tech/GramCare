/// Application-wide constants for GramCare.
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'GramCare';
  static const String appTagline =
      'Healthcare that speaks your language, works online or offline, and cares like your family.';
  static const String appVersion = '1.0.0';

  // Supported Languages
  static const String langEnglish = 'en';
  static const String langTamil = 'ta';
  static const String langHindi = 'hi';
  static const String langTelugu = 'te';

  static const List<String> supportedLanguages = [
    langEnglish,
    langTamil,
    langHindi,
    langTelugu,
  ];

  static const Map<String, String> languageNames = {
    langEnglish: 'English',
    langTamil: 'தமிழ்',
    langHindi: 'हिन्दी',
    langTelugu: 'తెలుగు',
  };

  // User Roles
  static const String roleElderly = 'ELDERLY_USER';
  static const String roleFamilyMember = 'FAMILY_MEMBER';
  static const String roleDoctor = 'DOCTOR';
  static const String roleCHW = 'COMMUNITY_HEALTH_WORKER';
  static const String roleAdmin = 'ADMINISTRATOR';

  // Medicine Frequencies
  static const String freqOnceDaily = 'ONCE_DAILY';
  static const String freqTwiceDaily = 'TWICE_DAILY';
  static const String freqThriceDaily = 'THRICE_DAILY';
  static const String freqFourTimesDaily = 'FOUR_TIMES_DAILY';
  static const String freqAsNeeded = 'AS_NEEDED';
  static const String freqWeekly = 'WEEKLY';

  // Medicine Timing
  static const String timingBeforeFood = 'BEFORE_FOOD';
  static const String timingAfterFood = 'AFTER_FOOD';
  static const String timingWithFood = 'WITH_FOOD';
  static const String timingMorning = 'MORNING';
  static const String timingAfternoon = 'AFTERNOON';
  static const String timingEvening = 'EVENING';
  static const String timingNight = 'NIGHT';

  // Medicine Log Status
  static const String logTaken = 'TAKEN';
  static const String logMissed = 'MISSED';
  static const String logSkipped = 'SKIPPED';

  // Risk Levels
  static const String riskLow = 'LOW';
  static const String riskMedium = 'MEDIUM';
  static const String riskHigh = 'HIGH';
  static const String riskCritical = 'CRITICAL';

  // Appointment Status
  static const String apptScheduled = 'SCHEDULED';
  static const String apptCompleted = 'COMPLETED';
  static const String apptCancelled = 'CANCELLED';
  static const String apptRescheduled = 'RESCHEDULED';

  // Emergency Alert Types
  static const String alertSOS = 'SOS';
  static const String alertFall = 'FALL';
  static const String alertMedical = 'MEDICAL';

  // Sync Status
  static const String syncPending = 'PENDING';
  static const String syncInProgress = 'IN_PROGRESS';
  static const String syncCompleted = 'COMPLETED';
  static const String syncFailed = 'FAILED';

  // Storage Keys
  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyUserRole = 'user_role';
  static const String keyLanguage = 'language';
  static const String keyHighContrast = 'high_contrast';
  static const String keyFontScale = 'font_scale';
  static const String keyOnboarded = 'onboarded';
  static const String keyFcmToken = 'fcm_token';

  // UI Constants
  static const double minFontScale = 1.0;
  static const double maxFontScale = 2.0;
  static const double defaultFontScale = 1.4; // Elderly-friendly default
  static const double elderlyButtonHeight = 64.0;
  static const double elderlyIconSize = 32.0;
  static const double elderlyPadding = 20.0;
  static const double elderlyBorderRadius = 16.0;

  // Timeout Durations
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;

  // Sync Constants
  static const int syncBatchSize = 50;
  static const int syncRetryAttempts = 3;
  static const int syncIntervalMinutes = 15;

  // Pagination
  static const int defaultPageSize = 20;
}
