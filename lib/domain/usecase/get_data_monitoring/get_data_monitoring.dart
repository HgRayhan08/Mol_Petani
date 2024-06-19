import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetDataMonitoring
    implements UseCase<Result<List<SubmissionKuotaFertilizer>>, String> {
  final SharedPrefRepository sharedPrefRepository;
  final FertilizerRepository fertilizerRepository;

  GetDataMonitoring(
      {required this.sharedPrefRepository, required this.fertilizerRepository});
  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> call(String params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await fertilizerRepository.getDataMonitoring(
        idPPL: user![1], idGroupFarmer: params);
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message),
    };
  }
}
