import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetKuotaFertilizerSubmission
    implements UseCase<Result<List<SubmissionKuotaFertilizer>>, void> {
  final SubmissionFretilizerRepository submission;
  final SharedPrefRepository sharedPrefRepository;

  GetKuotaFertilizerSubmission(
      {required this.submission, required this.sharedPrefRepository});

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> call(void params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var data = await submission.getkuotaFertilizer(
        idPPL: user![1], information: "Proses");
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
