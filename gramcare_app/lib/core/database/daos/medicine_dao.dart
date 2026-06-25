import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'medicine_dao.g.dart';

@DriftAccessor(tables: [Medicines, MedicineLogs])
class MedicineDao extends DatabaseAccessor<AppDatabase> with _$MedicineDaoMixin {
  MedicineDao(super.db);

  Future<List<Medicine>> getMedicinesByUserId(String userId) =>
      (select(medicines)
            ..where((m) => m.userId.equals(userId))
            ..where((m) => m.isActive.equals(true))
            ..orderBy([
              (m) => OrderingTerm.asc(m.timing),
            ]))
          .get();

  Stream<List<Medicine>> watchMedicinesByUserId(String userId) =>
      (select(medicines)
            ..where((m) => m.userId.equals(userId))
            ..where((m) => m.isActive.equals(true))
            ..orderBy([
              (m) => OrderingTerm.asc(m.timing),
            ]))
          .watch();

  Future<Medicine?> getMedicineById(String id) =>
      (select(medicines)..where((m) => m.id.equals(id))).getSingleOrNull();

  Future<int> insertMedicine(MedicinesCompanion medicine) =>
      into(medicines).insert(medicine, mode: InsertMode.insertOrReplace);

  Future<int> updateMedicine(MedicinesCompanion medicine) =>
      (update(medicines)..where((m) => m.id.equals(medicine.id.value))).write(medicine);

  Future<int> deleteMedicine(String id) =>
      (delete(medicines)..where((m) => m.id.equals(id))).go();

  Future<List<MedicineLog>> getLogsByMedicineId(String medicineId) =>
      (select(medicineLogs)
            ..where((l) => l.medicineId.equals(medicineId))
            ..orderBy([
              (l) => OrderingTerm.desc(l.logDate),
            ]))
          .get();

  Future<List<MedicineLog>> getLogsByUserIdAndDateRange(
    String userId,
    DateTime start,
    DateTime end,
  ) =>
      (select(medicineLogs)
            ..where((l) =>
                l.userId.equals(userId) &
                l.logDate.isBiggerOrEqualValue(start) &
                l.logDate.isSmallerOrEqualValue(end))
            ..orderBy([
              (l) => OrderingTerm.desc(l.logDate),
            ]))
          .get();

  Future<int> insertMedicineLog(MedicineLogsCompanion log) =>
      into(medicineLogs).insert(log, mode: InsertMode.insertOrReplace);
}
