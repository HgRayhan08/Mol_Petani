import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/get_submission_farmer_group/get_fertilizer_farmer_grup_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetSubmissionFarmerGroup
    implements
        UseCase<Result<List<DataSubmissionGroup>>,
            GetSubmissionFarmerGroupParams> {
  final SubmissionFretilizerRepository submissionFretilizerRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetSubmissionFarmerGroup(
      {required this.submissionFretilizerRepository,
      required this.sharedPrefRepository});

  @override
  Future<Result<List<DataSubmissionGroup>>> call(
      GetSubmissionFarmerGroupParams params) async {
    List<String>? idUser = await sharedPrefRepository.getDataLogin();
    var data = await submissionFretilizerRepository.getSubmissionFarmerGroup(
      idPPL: idUser![1],
      information: params.keterangan,
    );
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
