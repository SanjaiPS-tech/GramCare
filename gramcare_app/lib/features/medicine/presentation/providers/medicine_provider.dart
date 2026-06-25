import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/networking/dio_client.dart';
import '../../../../core/networking/network_info.dart';
import '../../data/datasources/medicine_remote_datasource.dart';
import '../../data/repositories/medicine_repository_impl.dart';
import '../../domain/repositories/medicine_repository.dart';
import '../../domain/usecases/medicine_usecases.dart';
import 'medicine_state.dart';
import '../../domain/entities/medicine_entity.dart';

final medicineRemoteDataSourceProvider = Provider<MedicineRemoteDataSource>((ref) {
  final dio = ref.read(dioClientProvider);
  return MedicineRemoteDataSource(dio);
});

final medicineRepositoryProvider = Provider<MedicineRepository>((ref) {
  final remoteDataSource = ref.read(medicineRemoteDataSourceProvider);
  final dao = ref.read(appDatabaseProvider).medicineDao;
  final networkInfo = ref.read(networkInfoProvider);
  return MedicineRepositoryImpl(remoteDataSource, dao, networkInfo);
});

final getMedicinesUseCaseProvider = Provider<GetMedicinesUseCase>((ref) {
  return GetMedicinesUseCase(ref.read(medicineRepositoryProvider));
});

final addMedicineUseCaseProvider = Provider<AddMedicineUseCase>((ref) {
  return AddMedicineUseCase(ref.read(medicineRepositoryProvider));
});

final updateMedicineUseCaseProvider = Provider<UpdateMedicineUseCase>((ref) {
  return UpdateMedicineUseCase(ref.read(medicineRepositoryProvider));
});

final deleteMedicineUseCaseProvider = Provider<DeleteMedicineUseCase>((ref) {
  return DeleteMedicineUseCase(ref.read(medicineRepositoryProvider));
});

class MedicineNotifier extends StateNotifier<MedicineState> {
  final GetMedicinesUseCase _getMedicinesUseCase;
  final AddMedicineUseCase _addMedicineUseCase;
  final UpdateMedicineUseCase _updateMedicineUseCase;
  final DeleteMedicineUseCase _deleteMedicineUseCase;

  MedicineNotifier({
    required GetMedicinesUseCase getMedicinesUseCase,
    required AddMedicineUseCase addMedicineUseCase,
    required UpdateMedicineUseCase updateMedicineUseCase,
    required DeleteMedicineUseCase deleteMedicineUseCase,
  })  : _getMedicinesUseCase = getMedicinesUseCase,
        _addMedicineUseCase = addMedicineUseCase,
        _updateMedicineUseCase = updateMedicineUseCase,
        _deleteMedicineUseCase = deleteMedicineUseCase,
        super(const MedicineState.initial()) {
    getMedicines();
  }

  Future<void> getMedicines() async {
    state = const MedicineState.loading();
    final result = await _getMedicinesUseCase();
    result.when(
      success: (data) => state = MedicineState.loaded(data),
      failure: (failure) => state = MedicineState.error(failure.userMessage),
    );
  }

  Future<void> addMedicine(MedicineEntity medicine) async {
    final result = await _addMedicineUseCase(medicine);
    result.when(
      success: (_) => getMedicines(),
      failure: (failure) => state = MedicineState.error(failure.userMessage),
    );
  }

  Future<void> updateMedicine(MedicineEntity medicine) async {
    final result = await _updateMedicineUseCase(medicine);
    result.when(
      success: (_) => getMedicines(),
      failure: (failure) => state = MedicineState.error(failure.userMessage),
    );
  }

  Future<void> deleteMedicine(String id) async {
    final result = await _deleteMedicineUseCase(id);
    result.when(
      success: (_) => getMedicines(),
      failure: (failure) => state = MedicineState.error(failure.userMessage),
    );
  }
}

final medicineNotifierProvider = StateNotifierProvider<MedicineNotifier, MedicineState>((ref) {
  return MedicineNotifier(
    getMedicinesUseCase: ref.read(getMedicinesUseCaseProvider),
    addMedicineUseCase: ref.read(addMedicineUseCaseProvider),
    updateMedicineUseCase: ref.read(updateMedicineUseCaseProvider),
    deleteMedicineUseCase: ref.read(deleteMedicineUseCaseProvider),
  );
});
