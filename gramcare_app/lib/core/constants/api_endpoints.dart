/// API endpoint constants for GramCare backend.
class ApiEndpoints {
  ApiEndpoints._();

  // Base URL - configured via environment
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8080/api/v1',
  );

  // Authentication
  static const String authBase = '/auth';
  static const String register = '$authBase/register';
  static const String login = '$authBase/login';
  static const String refreshToken = '$authBase/refresh';
  static const String logout = '$authBase/logout';
  static const String forgotPassword = '$authBase/forgot-password';
  static const String resetPassword = '$authBase/reset-password';
  static const String changePassword = '$authBase/change-password';

  // Users
  static const String usersBase = '/users';
  static const String userProfile = '$usersBase/me';
  static const String userByIdTemplate = '$usersBase/{id}';

  // Medicines
  static const String medicinesBase = '/medicines';
  static const String medicineByIdTemplate = '$medicinesBase/{id}';
  static const String medicineLogsTemplate = '$medicinesBase/{id}/logs';
  static const String medicineAdherence = '$medicinesBase/adherence';

  // Prescriptions
  static const String prescriptionsBase = '/prescriptions';
  static const String prescriptionUpload = '$prescriptionsBase/upload';
  static const String prescriptionByIdTemplate = '$prescriptionsBase/{id}';
  static const String prescriptionExplainTemplate =
      '$prescriptionsBase/{id}/explain';

  // Health Records
  static const String healthRecordsBase = '/health-records';
  static const String healthRecordByIdTemplate = '$healthRecordsBase/{id}';
  static const String healthRecordsExport = '$healthRecordsBase/export';

  // Emergency
  static const String emergencyBase = '/emergency';
  static const String emergencyAlert = '$emergencyBase/alert';
  static const String emergencyContacts = '$emergencyBase/contacts';
  static const String emergencyContactByIdTemplate =
      '$emergencyContacts/{id}';

  // Appointments
  static const String appointmentsBase = '/appointments';
  static const String appointmentByIdTemplate = '$appointmentsBase/{id}';
  static const String doctors = '/doctors';

  // Family
  static const String familyBase = '/family';
  static const String familyDashboardTemplate =
      '$familyBase/dashboard/{elderlyId}';
  static const String familyLink = '$familyBase/link';
  static const String familyLinkedUsers = '$familyBase/linked-users';

  // Health Worker
  static const String healthWorkerBase = '/health-worker';
  static const String hwPatients = '$healthWorkerBase/patients';
  static const String hwVisits = '$healthWorkerBase/visits';
  static const String hwSurveys = '$healthWorkerBase/surveys';
  static const String hwSync = '$healthWorkerBase/sync';

  // Risk Prediction
  static const String riskBase = '/risk';
  static const String riskByUserTemplate = '$riskBase/{userId}';
  static const String riskPredictTemplate = '$riskBase/{userId}/predict';

  // Notifications
  static const String notificationsBase = '/notifications';
  static const String notificationReadTemplate =
      '$notificationsBase/{id}/read';

  // Voice Call
  static const String voiceBase = '/voice';
  static const String voiceInitiateReminder = '$voiceBase/initiate-reminder';
  static const String voiceWebhook = '$voiceBase/webhook';
}
