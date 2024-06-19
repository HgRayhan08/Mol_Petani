import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetDistributionFertilizerGroup
    implements UseCase<Result<List<SubmissionKuotaFertilizer>>, void> {
  final FertilizerRepository submission;
  final SharedPrefRepository sharedPrefRepository;

  GetDistributionFertilizerGroup(
      {required this.submission, required this.sharedPrefRepository});

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> call(void params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var data = await submission.getDistributionFertilizerGroup(
      idPPL: user![3],
      idDistributor: user[1],
      information: "Send",
    );
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
