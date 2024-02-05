import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/get_all_submission_grup/get_submission_param.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetSubmissionGrupFertilizer
    implements UseCase<Result<List<DataPengajuanPupuk>>, GetSubmissionParams> {
  final SubmissionFretilizerRepository submissionFretilizerRepository;

  GetSubmissionGrupFertilizer({required this.submissionFretilizerRepository});

  @override
  Future<Result<List<DataPengajuanPupuk>>> call(
      GetSubmissionParams params) async {
    var data = await submissionFretilizerRepository.getSubmissionFertilizerGrup(
        idKelompoktani: params.idKelompok);
    print("jumlah data${data.resultValue!.length}");
    print("object");
    print(data.errorMessage);
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
