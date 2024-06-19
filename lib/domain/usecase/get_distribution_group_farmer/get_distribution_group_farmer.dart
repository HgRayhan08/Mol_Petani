import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetDistributionGroupFarmer
    implements UseCase<Result<List<SubmissionKuotaFertilizer>>, void> {
  final SharedPrefRepository sharedPrefRepository;
  final FertilizerRepository fertilizerRepository;

  GetDistributionGroupFarmer(
      {required this.sharedPrefRepository, required this.fertilizerRepository});

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> call(void params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();

    var result = await fertilizerRepository.getDistributionGroupFarmer(
        idPPL: user![2], idGroupFarmer: user[1], information: "Send");

    return switch (result) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
