import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/get_submission_fertilizer_farmer/get_submission_farmer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetSubmissionFarmer
    implements UseCase<Result<List<PetaniPupuk>>, GetSubmitionFarmerParams> {
  final SubmissionFretilizerRepository submissionFretilizerRepository;

  GetSubmissionFarmer({required this.submissionFretilizerRepository});
  @override
  Future<Result<List<PetaniPupuk>>> call(
      GetSubmitionFarmerParams params) async {
    var data = await submissionFretilizerRepository
        .getDataSubmissionFarmer(params.idSubmition);
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
