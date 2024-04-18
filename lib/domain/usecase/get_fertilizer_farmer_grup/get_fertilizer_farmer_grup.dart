import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer_grup/get_fertilizer_farmer_grup_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetFertilizerFarmerGrup
    implements
        UseCase<Result<List<DataSubmissionGroup>>,
            GetFertilizerFarmerGrupParams> {
  final SubmissionFretilizerRepository submissionFretilizerRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetFertilizerFarmerGrup(
      {required this.submissionFretilizerRepository,
      required this.sharedPrefRepository});

  @override
  Future<Result<List<DataSubmissionGroup>>> call(
      GetFertilizerFarmerGrupParams params) async {
    List<String>? idUser = await sharedPrefRepository.getDataLogin();
    var data =
        await submissionFretilizerRepository.getSubmissionFertilizerGroup(
      idKelompoktani: idUser![1],
      information: params.keterangan,
    );
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
