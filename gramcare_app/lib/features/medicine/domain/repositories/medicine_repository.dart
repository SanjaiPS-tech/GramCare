import '../../../../core/networking/api_result.dart';
import '../entities/medicine_entity.dart';

abstract class MedicineRepository {
  Future<ApiResult<List<MedicineEntity>>> getMedicines();
  Future<ApiResult<MedicineEntity>> addMedicine(MedicineEntity medicine);
  Future<ApiResult<void>> updateMedicine(MedicineEntity medicine);
  Future<ApiResult<void>> deleteMedicine(String id);
  Future<ApiResult<List<MedicineLogEntity>>> getMedicineLogs(String medicineId);
  Future<ApiResult<void>> logMedicineAction(MedicineLogEntity log);
  Future<ApiResult<Map<String, int>>> getAdherenceStats();
}
