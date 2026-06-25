import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

import 'daos/medicine_dao.dart';

part 'app_database.g.dart';


@DriftDatabase(tables: [
  Users,
  Medicines,
  MedicineLogs,
  Prescriptions,
  HealthRecords,
  EmergencyContacts,
  EmergencyAlerts,
  Appointments,
  FamilyMonitoring,
  RiskPredictions,
  HealthWorkerVisits,
  Surveys,
  Notifications,
  AuditLogs,
  SyncQueue,
], daos: [
  MedicineDao,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Handle future migrations here
        },
        beforeOpen: (details) async {
          // Enable foreign keys
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  // ===================== USER QUERIES =====================

  Future<List<User>> getAllUsers() => select(users).get();

  Future<User?> getUserById(String id) =>
      (select(users)..where((u) => u.id.equals(id))).getSingleOrNull();

  Future<int> insertUser(UsersCompanion user) =>
      into(users).insert(user, mode: InsertMode.insertOrReplace);

  Future<bool> updateUser(UsersCompanion user) =>
      update(users).replace(user as Insertable<User>);

  Future<int> deleteUser(String id) =>
      (delete(users)..where((u) => u.id.equals(id))).go();

  // DAOs are used for queries

  // ===================== PRESCRIPTION QUERIES =====================

  Future<List<Prescription>> getPrescriptionsByUserId(String userId) =>
      (select(prescriptions)
            ..where((p) => p.userId.equals(userId))
            ..orderBy([
              (p) => OrderingTerm.desc(p.createdAt),
            ]))
          .get();

  Future<Prescription?> getPrescriptionById(String id) =>
      (select(prescriptions)..where((p) => p.id.equals(id)))
          .getSingleOrNull();

  Future<int> insertPrescription(PrescriptionsCompanion prescription) =>
      into(prescriptions)
          .insert(prescription, mode: InsertMode.insertOrReplace);

  // ===================== HEALTH RECORD QUERIES =====================

  Future<List<HealthRecord>> getHealthRecordsByUserId(String userId) =>
      (select(healthRecords)
            ..where((r) => r.userId.equals(userId))
            ..orderBy([
              (r) => OrderingTerm.desc(r.recordDate),
            ]))
          .get();

  Future<int> insertHealthRecord(HealthRecordsCompanion record) =>
      into(healthRecords).insert(record, mode: InsertMode.insertOrReplace);

  Future<int> deleteHealthRecord(String id) =>
      (delete(healthRecords)..where((r) => r.id.equals(id))).go();

  // ===================== EMERGENCY QUERIES =====================

  Future<List<EmergencyContact>> getEmergencyContactsByUserId(
          String userId) =>
      (select(emergencyContacts)
            ..where((c) => c.userId.equals(userId))
            ..orderBy([
              (c) => OrderingTerm.desc(c.isPrimary),
            ]))
          .get();

  Future<int> insertEmergencyContact(EmergencyContactsCompanion contact) =>
      into(emergencyContacts)
          .insert(contact, mode: InsertMode.insertOrReplace);

  Future<int> deleteEmergencyContact(String id) =>
      (delete(emergencyContacts)..where((c) => c.id.equals(id))).go();

  Future<int> insertEmergencyAlert(EmergencyAlertsCompanion alert) =>
      into(emergencyAlerts).insert(alert, mode: InsertMode.insertOrReplace);

  // ===================== APPOINTMENT QUERIES =====================

  Future<List<Appointment>> getAppointmentsByPatientId(String patientId) =>
      (select(appointments)
            ..where((a) => a.patientId.equals(patientId))
            ..orderBy([
              (a) => OrderingTerm.desc(a.appointmentTime),
            ]))
          .get();

  Future<List<Appointment>> getUpcomingAppointments(String patientId) =>
      (select(appointments)
            ..where((a) =>
                a.patientId.equals(patientId) &
                a.appointmentTime.isBiggerThanValue(DateTime.now()) &
                a.status.equals('SCHEDULED'))
            ..orderBy([
              (a) => OrderingTerm.asc(a.appointmentTime),
            ]))
          .get();

  Future<int> insertAppointment(AppointmentsCompanion appointment) =>
      into(appointments)
          .insert(appointment, mode: InsertMode.insertOrReplace);

  // ===================== FAMILY MONITORING =====================

  Future<List<FamilyMonitoringData>> getFamilyLinks(String familyMemberId) =>
      (select(familyMonitoring)
            ..where((f) => f.familyMemberId.equals(familyMemberId)))
          .get();

  Future<int> insertFamilyLink(FamilyMonitoringCompanion link) =>
      into(familyMonitoring).insert(link, mode: InsertMode.insertOrReplace);

  // ===================== RISK PREDICTIONS =====================

  Future<RiskPrediction?> getLatestRiskPrediction(String userId) =>
      (select(riskPredictions)
            ..where((r) => r.userId.equals(userId))
            ..orderBy([
              (r) => OrderingTerm.desc(r.predictedAt),
            ])
            ..limit(1))
          .getSingleOrNull();

  Future<int> insertRiskPrediction(RiskPredictionsCompanion prediction) =>
      into(riskPredictions)
          .insert(prediction, mode: InsertMode.insertOrReplace);

  // ===================== HEALTH WORKER =====================

  Future<List<HealthWorkerVisit>> getVisitsByWorkerId(String workerId) =>
      (select(healthWorkerVisits)
            ..where((v) => v.workerId.equals(workerId))
            ..orderBy([
              (v) => OrderingTerm.desc(v.visitedAt),
            ]))
          .get();

  Future<int> insertVisit(HealthWorkerVisitsCompanion visit) =>
      into(healthWorkerVisits)
          .insert(visit, mode: InsertMode.insertOrReplace);

  Future<int> insertSurvey(SurveysCompanion survey) =>
      into(surveys).insert(survey, mode: InsertMode.insertOrReplace);

  // ===================== NOTIFICATIONS =====================

  Future<List<Notification>> getNotificationsByUserId(String userId) =>
      (select(notifications)
            ..where((n) => n.userId.equals(userId))
            ..orderBy([
              (n) => OrderingTerm.desc(n.createdAt),
            ]))
          .get();

  Stream<List<Notification>> watchUnreadNotifications(String userId) =>
      (select(notifications)
            ..where(
                (n) => n.userId.equals(userId) & n.isRead.equals(false))
            ..orderBy([
              (n) => OrderingTerm.desc(n.createdAt),
            ]))
          .watch();

  Future<int> insertNotification(NotificationsCompanion notification) =>
      into(notifications)
          .insert(notification, mode: InsertMode.insertOrReplace);

  Future<void> markNotificationRead(String id) =>
      (update(notifications)..where((n) => n.id.equals(id)))
          .write(const NotificationsCompanion(isRead: Value(true)));

  // ===================== AUDIT LOGS =====================

  Future<int> insertAuditLog(AuditLogsCompanion log) =>
      into(auditLogs).insert(log);

  // ===================== SYNC QUEUE =====================

  Future<List<SyncQueueData>> getPendingSyncItems() =>
      (select(syncQueue)
            ..where((s) => s.status.equals('PENDING'))
            ..orderBy([
              (s) => OrderingTerm.asc(s.createdAt),
            ]))
          .get();

  Future<int> insertSyncItem(SyncQueueCompanion item) =>
      into(syncQueue).insert(item);

  Future<void> markSyncItemProcessed(int id) =>
      (update(syncQueue)..where((s) => s.id.equals(id))).write(
        SyncQueueCompanion(
          status: const Value('COMPLETED'),
          processedAt: Value(DateTime.now()),
        ),
      );

  Future<void> markSyncItemFailed(int id, {int? retryCount}) =>
      (update(syncQueue)..where((s) => s.id.equals(id))).write(
        SyncQueueCompanion(
          status: const Value('FAILED'),
          retryCount: Value(retryCount ?? 0),
        ),
      );

  Future<void> clearProcessedSyncItems() =>
      (delete(syncQueue)..where((s) => s.status.equals('COMPLETED'))).go();

  // ===================== ADHERENCE CALCULATIONS =====================

  /// Calculate adherence percentage for a user over a date range.
  Future<double> calculateAdherence(
    String userId,
    DateTime start,
    DateTime end,
  ) async {
    final logs = await getLogsByUserIdAndDateRange(userId, start, end);
    if (logs.isEmpty) return 0.0;

    final takenCount = logs.where((l) => l.status == 'TAKEN').length;
    return (takenCount / logs.length) * 100;
  }

  /// Get adherence stats breakdown.
  Future<Map<String, int>> getAdherenceBreakdown(
    String userId,
    DateTime start,
    DateTime end,
  ) async {
    final logs = await getLogsByUserIdAndDateRange(userId, start, end);
    return {
      'taken': logs.where((l) => l.status == 'TAKEN').length,
      'missed': logs.where((l) => l.status == 'MISSED').length,
      'skipped': logs.where((l) => l.status == 'SKIPPED').length,
      'total': logs.length,
    };
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'gramcare.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

/// Provider for the database.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});
