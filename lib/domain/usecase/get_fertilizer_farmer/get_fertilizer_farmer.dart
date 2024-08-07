import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer/get_submission_farmer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetFertilizerFarmer
    implements
        UseCase<Result<List<SupportingDataFertilizer>>,
            GetSubmitionFarmerParams> {
  final SubmissionFretilizerRepository submissionFretilizerRepository;

  GetFertilizerFarmer({required this.submissionFretilizerRepository});
  @override
  Future<Result<List<SupportingDataFertilizer>>> call(
      GetSubmitionFarmerParams params) async {
    var data = await submissionFretilizerRepository.getadditionalDataSubmission(
      params.idSubmition,
    );
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
