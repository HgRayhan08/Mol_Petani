import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_farmer_grup/create_fertilizer_grup_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateFertilizerFarmerGrup
    implements
        UseCase<Result<DataSubmissionGroup>, CreateFertilizerGrupParams> {
  final SubmissionFretilizerRepository pengajuanRepository;
  final SharedPrefRepository sharedPrefRepository;

  CreateFertilizerFarmerGrup(
      {required this.pengajuanRepository, required this.sharedPrefRepository});

  @override
  Future<Result<DataSubmissionGroup>> call(
      CreateFertilizerGrupParams params) async {
    List<String>? idUser = await sharedPrefRepository.getDataLogin();
    var result = await pengajuanRepository.createSubmissionFertilizer(
      idGrupFarmers: idUser![1],
      idPPL: idUser[2],
      leaderName: params.leaderName,
      village: params.village,
      forYear: params.forYear,
      date: params.date,
      grupFarmer: params.grupFarmer,
    );
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
