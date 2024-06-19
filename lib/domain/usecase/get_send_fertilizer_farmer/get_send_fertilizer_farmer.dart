import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetSendFertilizerFarmer
    implements UseCase<Result<List<DistributionFertilizerFarmer>>, String> {
  final SharedPrefRepository sharedPrefRepository;
  final FertilizerRepository fertilizerRepository;

  GetSendFertilizerFarmer(
      {required this.sharedPrefRepository, required this.fertilizerRepository});
  @override
  Future<Result<List<DistributionFertilizerFarmer>>> call(String params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await fertilizerRepository.getsendFertilizerFarmer(
        idFarmer: params, idGroupFarmer: user![1]);
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message),
    };
  }
}
