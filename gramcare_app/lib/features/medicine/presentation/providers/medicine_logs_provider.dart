import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/medicine_entity.dart';
import '../../domain/usecases/medicine_usecases.dart';
import 'medicine_provider.dart';

final getMedicineLogsUseCaseProvider = Provider<GetMedicineLogsUseCase>((ref) {
  return GetMedicineLogsUseCase(ref.read(medicineRepositoryProvider));
});

final logMedicineActionUseCaseProvider = Provider<LogMedicineActionUseCase>((ref) {
  return LogMedicineActionUseCase(ref.read(medicineRepositoryProvider));
});

final medicineLogsProvider = FutureProvider.family<List<MedicineLogEntity>, String>((ref, medicineId) async {
  final result = await ref.read(getMedicineLogsUseCaseProvider)(medicineId);
  return result.when(
    success: (data) => data,
    failure: (failure) => throw failure,
  );
});

class MedicineLogNotifier extends StateNotifier<AsyncValue<void>> {
  final LogMedicineActionUseCase _logMedicineActionUseCase;
  final Ref _ref;

  MedicineLogNotifier(this._logMedicineActionUseCase, this._ref) : super(const AsyncValue.data(null));

  Future<void> logAction(MedicineLogEntity log) async {
    state = const AsyncValue.loading();
    final result = await _logMedicineActionUseCase(log);
    result.when(
      success: (_) {
        state = const AsyncValue.data(null);
        _ref.invalidate(medicineLogsProvider(log.medicineId));
      },
      failure: (failure) => state = AsyncValue.error(failure.userMessage, StackTrace.current),
    );
  }
}

final medicineLogNotifierProvider = StateNotifierProvider<MedicineLogNotifier, AsyncValue<void>>((ref) {
  return MedicineLogNotifier(ref.read(logMedicineActionUseCaseProvider), ref);
});
