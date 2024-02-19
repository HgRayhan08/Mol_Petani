import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/get_submission_fertilizer_grup/get_submission_grup_fertilizer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetSubmissionGrupFertilizer
    implements
        UseCase<Result<List<DataSubmissionFertilizer>>,
            GetSubmissionGrupFertilizerParams> {
  final SubmissionFretilizerRepository submissionFretilizerRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetSubmissionGrupFertilizer(
      {required this.submissionFretilizerRepository,
      required this.sharedPrefRepository});

  @override
  Future<Result<List<DataSubmissionFertilizer>>> call(
      GetSubmissionGrupFertilizerParams params) async {
    List<String>? idUser = await sharedPrefRepository.getDataLogin();
    var data = await submissionFretilizerRepository.getSubmissionFertilizerGrup(
        idKelompoktani: params.uid == null ? idUser![1] : params.uid.toString(),
        keterangan: params.keterangan);

    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
