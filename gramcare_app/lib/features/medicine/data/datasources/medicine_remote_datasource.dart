import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/medicine_model.dart';

part 'medicine_remote_datasource.g.dart';

@RestApi()
abstract class MedicineRemoteDataSource {
  factory MedicineRemoteDataSource(Dio dio, {String baseUrl}) = _MedicineRemoteDataSource;

  @GET(ApiEndpoints.medicinesBase)
  Future<List<MedicineModel>> getMedicines();

  @POST(ApiEndpoints.medicinesBase)
  Future<MedicineModel> addMedicine(@Body() MedicineModel medicine);

  @PUT(ApiEndpoints.medicineByIdTemplate)
  Future<void> updateMedicine(@Path('id') String id, @Body() MedicineModel medicine);

  @DELETE(ApiEndpoints.medicineByIdTemplate)
  Future<void> deleteMedicine(@Path('id') String id);

  @GET(ApiEndpoints.medicineLogsTemplate)
  Future<List<MedicineLogModel>> getMedicineLogs(@Path('id') String id);

  @POST(ApiEndpoints.medicineLogsTemplate)
  Future<void> logMedicineAction(@Path('id') String id, @Body() MedicineLogModel log);

  @GET(ApiEndpoints.medicineAdherence)
  Future<Map<String, int>> getAdherenceStats();
}
