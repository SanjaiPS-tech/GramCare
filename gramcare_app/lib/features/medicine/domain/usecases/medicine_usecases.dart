import '../../../../core/networking/api_result.dart';
import '../entities/medicine_entity.dart';
import '../repositories/medicine_repository.dart';

class GetMedicinesUseCase {
  final MedicineRepository _repository;
  GetMedicinesUseCase(this._repository);
  Future<ApiResult<List<MedicineEntity>>> call() => _repository.getMedicines();
}

class AddMedicineUseCase {
  final MedicineRepository _repository;
  AddMedicineUseCase(this._repository);
  Future<ApiResult<MedicineEntity>> call(MedicineEntity medicine) => _repository.addMedicine(medicine);
}

class UpdateMedicineUseCase {
  final MedicineRepository _repository;
  UpdateMedicineUseCase(this._repository);
  Future<ApiResult<void>> call(MedicineEntity medicine) => _repository.updateMedicine(medicine);
}

class DeleteMedicineUseCase {
  final MedicineRepository _repository;
  DeleteMedicineUseCase(this._repository);
  Future<ApiResult<void>> call(String id) => _repository.deleteMedicine(id);
}

class GetMedicineLogsUseCase {
  final MedicineRepository _repository;
  GetMedicineLogsUseCase(this._repository);
  Future<ApiResult<List<MedicineLogEntity>>> call(String medicineId) => _repository.getMedicineLogs(medicineId);
}

class LogMedicineActionUseCase {
  final MedicineRepository _repository;
  LogMedicineActionUseCase(this._repository);
  Future<ApiResult<void>> call(MedicineLogEntity log) => _repository.logMedicineAction(log);
}

class GetAdherenceStatsUseCase {
  final MedicineRepository _repository;
  GetAdherenceStatsUseCase(this._repository);
  Future<ApiResult<Map<String, int>>> call() => _repository.getAdherenceStats();
}
