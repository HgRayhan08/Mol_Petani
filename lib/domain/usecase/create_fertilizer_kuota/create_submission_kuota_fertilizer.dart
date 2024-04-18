import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_kuota/submission_kuota_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateFertilizerKuota
    implements
        UseCase<Result<SubmissionKuotaFertilizer>, SubmissionKuotaParams> {
  final SubmissionFretilizerRepository submission;
  final SharedPrefRepository sharedPrefRepository;

  CreateFertilizerKuota({
    required this.submission,
    required this.sharedPrefRepository,
  });

  @override
  Future<Result<SubmissionKuotaFertilizer>> call(
      SubmissionKuotaParams params) async {
    DateTime date = DateTime.now();
    List<String>? idUser = await sharedPrefRepository.getDataLogin();
    var result = await submission.createSubmissionKuotafertilizerGrup(
      idGrup: params.idGrup,
      idSubmission: params.idSubmission,
      idPpl: idUser![1],
      leaderName: params.leaderName,
      pplName: idUser[2],
      distributorName: params.distributorName,
      grupFarmer: params.grupFarmer,
      village: params.village,
      submission: params.submission + 1,
      urea: params.urea,
      poska: params.poska,
      forYear: params.forYear,
      dateOfFiling: DateFormat("dd-MM-yyyy").format(date).toString(),
    );
    int nilai = params.submission + 1;
    var update = await submission.updateSubmission(
        submission: nilai, id: params.idSubmission);

    if (update.isSuccess) {
      if (result.isSuccess) {
        return Result.success(result.resultValue!);
      } else {
        return Result.failed(result.errorMessage!);
      }
    } else {
      return Result.failed(update.errorMessage!);
    }
  }
}
