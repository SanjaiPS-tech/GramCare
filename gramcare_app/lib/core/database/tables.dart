import 'package:drift/drift.dart';

// ============================================================
// TABLE DEFINITIONS FOR GRAMCARE LOCAL DATABASE
// ============================================================

/// Users table for local caching of user profiles.
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get phone => text().withLength(min: 10, max: 15)();
  TextColumn get email => text().nullable()();
  TextColumn get fullName => text().withLength(min: 1, max: 200)();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get bloodGroup => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get village => text().nullable()();
  TextColumn get district => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get languagePreference =>
      text().withDefault(const Constant('en'))();
  TextColumn get profileImageUrl => text().nullable()();
  TextColumn get role => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('COMPLETED'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Medicines table for medicine reminder management.
class Medicines extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get name => text().withLength(min: 1, max: 300)();
  TextColumn get dosage => text()();
  TextColumn get frequency => text()();
  TextColumn get timing => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get instructions => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Medicine logs for tracking taken/missed/skipped status.
class MedicineLogs extends Table {
  TextColumn get id => text()();
  TextColumn get medicineId => text().references(Medicines, #id)();
  TextColumn get userId => text().references(Users, #id)();
  DateTimeColumn get logDate => dateTime()();
  TextColumn get scheduledTime => text()();
  TextColumn get status => text()(); // TAKEN, MISSED, SKIPPED
  DateTimeColumn get takenAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Prescriptions table for scanned/uploaded prescriptions.
class Prescriptions extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get imagePath => text().nullable()(); // Local path for offline
  TextColumn get ocrText => text().nullable()();
  TextColumn get aiExplanation => text().nullable()();
  TextColumn get language => text().withDefault(const Constant('en'))();
  TextColumn get doctorId => text().nullable()();
  DateTimeColumn get prescribedDate => dateTime().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Health records for medical history.
class HealthRecords extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get recordType => text()(); // DISEASE, ALLERGY, SURGERY, etc.
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get fileUrl => text().nullable()();
  TextColumn get filePath => text().nullable()(); // Local path
  DateTimeColumn get recordDate => dateTime()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Emergency contacts.
class EmergencyContacts extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get relationship => text()();
  BoolColumn get isPrimary => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Emergency alerts triggered by SOS.
class EmergencyAlerts extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get alertType => text()(); // SOS, FALL, MEDICAL
  TextColumn get status => text()(); // TRIGGERED, ACKNOWLEDGED, RESOLVED
  DateTimeColumn get triggeredAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get resolvedAt => dateTime().nullable()();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Appointments for telemedicine.
class Appointments extends Table {
  TextColumn get id => text()();
  TextColumn get patientId => text().references(Users, #id)();
  TextColumn get doctorId => text()();
  DateTimeColumn get appointmentTime => dateTime()();
  TextColumn get status => text()(); // SCHEDULED, COMPLETED, CANCELLED
  TextColumn get meetingLink => text().nullable()();
  TextColumn get consultationNotes => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Family monitoring links.
class FamilyMonitoring extends Table {
  TextColumn get id => text()();
  TextColumn get familyMemberId => text()();
  TextColumn get elderlyUserId => text().references(Users, #id)();
  TextColumn get relationship => text()();
  BoolColumn get isApproved =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get linkedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// AI-generated risk predictions.
class RiskPredictions extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  IntColumn get healthScore => integer()();
  TextColumn get riskLevel => text()(); // LOW, MEDIUM, HIGH, CRITICAL
  TextColumn get diabetesRisk => text().nullable()();
  TextColumn get hypertensionRisk => text().nullable()();
  TextColumn get complianceRisk => text().nullable()();
  TextColumn get hospitalizationRisk => text().nullable()();
  TextColumn get recommendations => text().nullable()();
  DateTimeColumn get predictedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Health worker visit logs.
class HealthWorkerVisits extends Table {
  TextColumn get id => text()();
  TextColumn get workerId => text()();
  TextColumn get patientId => text().references(Users, #id)();
  TextColumn get visitType => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get observations => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  DateTimeColumn get visitedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Surveys conducted by health workers.
class Surveys extends Table {
  TextColumn get id => text()();
  TextColumn get workerId => text()();
  TextColumn get patientId => text().references(Users, #id)();
  TextColumn get surveyType => text()();
  TextColumn get responses => text()(); // JSON string
  DateTimeColumn get completedAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Notifications.
class Notifications extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get title => text()();
  TextColumn get body => text()();
  TextColumn get type => text()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Audit logs for tracking user actions.
class AuditLogs extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().nullable()();
  TextColumn get action => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text().nullable()();
  TextColumn get oldValue => text().nullable()();
  TextColumn get newValue => text().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus =>
      text().withDefault(const Constant('PENDING'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Sync queue for offline operations.
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get operation => text()(); // CREATE, UPDATE, DELETE
  TextColumn get payload => text()(); // JSON
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get status =>
      text().withDefault(const Constant('PENDING'))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get processedAt => dateTime().nullable()();
}
