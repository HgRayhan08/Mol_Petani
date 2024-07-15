import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/update_distribution_fertilizer_farmer/distribution_fertilzer_farmer_params.dart';
import 'package:mol_petani/domain/usecase/update_send_fertilizer/update_sends_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateDistributionFertilizerFarmer
    implements UseCase<Result<String>, DistributionFertilizerFarmerParams> {
  final FertilizerRepository fertilizerRepository;

  UpdateDistributionFertilizerFarmer({required this.fertilizerRepository});

  @override
  Future<Result<String>> call(DistributionFertilizerFarmerParams params) async {
    var result = await fertilizerRepository.updateDistributionFertilizerFarmer(
        urea: params.urea, poska: params.poska, idDocument: params.idDocument);
    return switch (result) {
      Success() => const Result.success("Update Succes"),
      Failed(:final message) => Result.failed(message)
    };
  }
}
