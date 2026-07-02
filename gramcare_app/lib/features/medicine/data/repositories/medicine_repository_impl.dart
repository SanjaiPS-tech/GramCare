import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/medicine_dao.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/network_info.dart';
import '../../domain/entities/medicine_entity.dart';
import '../../domain/repositories/medicine_repository.dart';
import '../datasources/medicine_remote_datasource.dart';
import '../models/medicine_model.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineRemoteDataSource _remoteDataSource;
  final MedicineDao _medicineDao;
  final NetworkInfo _networkInfo;

  MedicineRepositoryImpl(
    this._remoteDataSource,
    this._medicineDao,
    this._networkInfo,
  );

  @override
  Future<ApiResult<List<MedicineEntity>>> getMedicines() async {
    try {
      if (await _networkInfo.isConnected) {
        final remoteMedicines = await _remoteDataSource.getMedicines();
        
        // Update local database
        for (final model in remoteMedicines) {
          await _medicineDao.insertMedicine(_modelToCompanion(model));
        }
      }
      
      // Fetch from local (either fresh or cached)
      // Note: In a real app we'd get the current user ID from an auth service
      final userId = 'current_user_id'; // Placeholder
      final localMedicines = await _medicineDao.getMedicinesByUserId(userId);
      
      return ApiResult.success(data: localMedicines.map(_dbToEntity).toList());
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(error: e));
    }
  }

  @override
  Future<ApiResult<MedicineEntity>> addMedicine(MedicineEntity medicine) async {
    try {
      final model = _entityToModel(medicine);
      
      if (await _networkInfo.isConnected) {
        final remoteResponse = await _remoteDataSource.addMedicine(model);
        await _medicineDao.insertMedicine(_modelToCompanion(remoteResponse));
        return ApiResult.success(data: _modelToEntity(remoteResponse));
      } else {
        // Save locally with PENDING status
        final companion = _entityToCompanion(medicine).copyWith(
          syncStatus: const Value('PENDING'),
        );
        await _medicineDao.insertMedicine(companion);
        return ApiResult.success(data: medicine);
      }
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(error: e));
    }
  }

  @override
  Future<ApiResult<void>> updateMedicine(MedicineEntity medicine) async {
    try {
      final model = _entityToModel(medicine);
      
      if (await _networkInfo.isConnected) {
        await _remoteDataSource.updateMedicine(medicine.id, model);
        await _medicineDao.insertMedicine(_modelToCompanion(model));
      } else {
        await _medicineDao.updateMedicine(_entityToCompanion(medicine).copyWith(
          syncStatus: const Value('PENDING'),
        ));
      }
      return const ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(error: e));
    }
  }

  @override
  Future<ApiResult<void>> deleteMedicine(String id) async {
    try {
      if (await _networkInfo.isConnected) {
        await _remoteDataSource.deleteMedicine(id);
      }
      await _medicineDao.deleteMedicine(id);
      return const ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(error: e));
    }
  }

  @override
  Future<ApiResult<List<MedicineLogEntity>>> getMedicineLogs(String medicineId) async {
    try {
      if (await _networkInfo.isConnected) {
        final remoteLogs = await _remoteDataSource.getMedicineLogs(medicineId);
        for (final log in remoteLogs) {
          await _medicineDao.insertMedicineLog(_logModelToCompanion(log));
        }
      }
      final localLogs = await _medicineDao.getLogsByMedicineId(medicineId);
      return ApiResult.success(data: localLogs.map(_dbLogToEntity).toList());
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(error: e));
    }
  }

  @override
  Future<ApiResult<void>> logMedicineAction(MedicineLogEntity log) async {
    try {
      final model = _logEntityToModel(log);
      if (await _networkInfo.isConnected) {
        await _remoteDataSource.logMedicineAction(log.medicineId, model);
        await _medicineDao.insertMedicineLog(_logModelToCompanion(model));
      } else {
        await _medicineDao.insertMedicineLog(_logEntityToCompanion(log).copyWith(
          syncStatus: const Value('PENDING'),
        ));
      }
      return const ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(error: e));
    }
  }

  @override
  Future<ApiResult<Map<String, int>>> getAdherenceStats() async {
    try {
      if (await _networkInfo.isConnected) {
        final stats = await _remoteDataSource.getAdherenceStats();
        return ApiResult.success(data: stats);
      } else {
        // Calculate locally from logs
        final userId = 'current_user_id';
        final now = DateTime.now();
        final start = now.subtract(const Duration(days: 30));
        final stats = await _medicineDao.db.getAdherenceBreakdown(userId, start, now);
        return ApiResult.success(data: stats);
      }
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(error: e));
    }
  }

  // ===================== MAPPERS =====================

  MedicineEntity _dbToEntity(Medicine row) {
    return MedicineEntity(
      id: row.id,
      userId: row.userId,
      name: row.name,
      dosage: row.dosage,
      frequency: row.frequency,
      timing: row.timing,
      startDate: row.startDate,
      endDate: row.endDate,
      instructions: row.instructions,
      isActive: row.isActive,
    );
  }

  MedicinesCompanion _modelToCompanion(MedicineModel model) {
    return MedicinesCompanion(
      id: Value(model.id),
      userId: Value(model.userId),
      name: Value(model.name),
      dosage: Value(model.dosage),
      frequency: Value(model.frequency),
      timing: Value(model.timing),
      startDate: Value(model.startDate),
      endDate: Value(model.endDate),
      instructions: Value(model.instructions),
      isActive: Value(model.isActive),
      syncStatus: Value(model.syncStatus),
    );
  }

  MedicinesCompanion _entityToCompanion(MedicineEntity entity) {
    return MedicinesCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      name: Value(entity.name),
      dosage: Value(entity.dosage),
      frequency: Value(entity.frequency),
      timing: Value(entity.timing),
      startDate: Value(entity.startDate),
      endDate: Value(entity.endDate),
      instructions: Value(entity.instructions),
      isActive: Value(entity.isActive),
    );
  }

  MedicineModel _entityToModel(MedicineEntity entity) {
    return MedicineModel(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      dosage: entity.dosage,
      frequency: entity.frequency,
      timing: entity.timing,
      startDate: entity.startDate,
      endDate: entity.endDate,
      instructions: entity.instructions,
      isActive: entity.isActive,
    );
  }

  MedicineEntity _modelToEntity(MedicineModel model) {
    return MedicineEntity(
      id: model.id,
      userId: model.userId,
      name: model.name,
      dosage: model.dosage,
      frequency: model.frequency,
      timing: model.timing,
      startDate: model.startDate,
      endDate: model.endDate,
      instructions: model.instructions,
      isActive: model.isActive,
    );
  }

  MedicineLogEntity _dbLogToEntity(MedicineLog row) {
    return MedicineLogEntity(
      id: row.id,
      medicineId: row.medicineId,
      userId: row.userId,
      logDate: row.logDate,
      scheduledTime: row.scheduledTime,
      status: row.status,
      takenAt: row.takenAt,
      notes: row.notes,
    );
  }

  MedicineLogsCompanion _logModelToCompanion(MedicineLogModel model) {
    return MedicineLogsCompanion(
      id: Value(model.id),
      medicineId: Value(model.medicineId),
      userId: Value(model.userId),
      logDate: Value(model.logDate),
      scheduledTime: Value(model.scheduledTime),
      status: Value(model.status),
      takenAt: Value(model.takenAt),
      notes: Value(model.notes),
      syncStatus: Value(model.syncStatus),
    );
  }

  MedicineLogModel _logEntityToModel(MedicineLogEntity entity) {
    return MedicineLogModel(
      id: entity.id,
      medicineId: entity.medicineId,
      userId: entity.userId,
      logDate: entity.logDate,
      scheduledTime: entity.scheduledTime,
      status: entity.status,
      takenAt: entity.takenAt,
      notes: entity.notes,
    );
  }

  MedicineLogsCompanion _logEntityToCompanion(MedicineLogEntity entity) {
    return MedicineLogsCompanion(
      id: Value(entity.id),
      medicineId: Value(entity.medicineId),
      userId: Value(entity.userId),
      logDate: Value(entity.logDate),
      scheduledTime: Value(entity.scheduledTime),
      status: Value(entity.status),
      takenAt: Value(entity.takenAt),
      notes: Value(entity.notes),
    );
  }
}
