import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetKuotaAccepted
    implements UseCase<Result<List<SubmissionKuotaFertilizer>>, void> {
  final SharedPrefRepository sharedPrefRepository;
  final SubmissionFretilizerRepository submission;

  GetKuotaAccepted({
    required this.sharedPrefRepository,
    required this.submission,
  });

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> call(void _) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var dataAccepted = await submission.getKuotaAccepted(
        idGrupFarmer: user![1], information: "Proses");
    return switch (dataAccepted) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
