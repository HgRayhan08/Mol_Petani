import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_submission_fertilizer_grup/create_fertilizer_grup_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateSubmissionFertilizerGrup
    implements
        UseCase<Result<DataSubmissionFertilizer>, CreateFertilizerGrupParams> {
  final SubmissionFretilizerRepository pengajuanRepository;
  final SharedPrefRepository sharedPrefRepository;

  CreateSubmissionFertilizerGrup(
      {required this.pengajuanRepository, required this.sharedPrefRepository});

  @override
  Future<Result<DataSubmissionFertilizer>> call(
      CreateFertilizerGrupParams params) async {
    List<String>? idUser = await sharedPrefRepository.getDataLogin();
    var result = await pengajuanRepository.createSubmissionFertilizer(
      idGrupFarmers: idUser![1],
      leaderName: params.leaderName,
      village: params.village,
      forYear: params.forYear,
      date: params.date,
      grupFarmer: params.grupFarmer,
      keterangan: "",
    );
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
