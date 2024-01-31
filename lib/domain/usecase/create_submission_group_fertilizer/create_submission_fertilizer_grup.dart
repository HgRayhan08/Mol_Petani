import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_submission_group_fertilizer/create_pengajuan_kelompok_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateSubmissionFertilizerGrup
    implements
        UseCase<Result<DataPengajuanPupuk>, CreateSubmissionFertilizerParams> {
  final SubmissionFretilizerRepository _pengajuanRepository;

  CreateSubmissionFertilizerGrup(
      {required SubmissionFretilizerRepository pengajuanRepository})
      : _pengajuanRepository = pengajuanRepository;

  @override
  Future<Result<DataPengajuanPupuk>> call(
      CreateSubmissionFertilizerParams params) async {
    var result = await _pengajuanRepository.createSubmissionFertilizer(
      idkelompoktani: params.idKelompoktani,
      namaKetua: params.namaKetua,
      desa: params.desa,
      forYear: params.forYear,
      tanggal: params.tanggal,
      petaniPupuk: params.petaniPupuk,
    );
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
