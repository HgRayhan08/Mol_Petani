import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_send_fertilizer_farmer/send_farmer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateSendFertilizerFarmer
    implements UseCase<Result<DistributionFertilizerFarmer>, SendFarmerParams> {
  final SharedPrefRepository sharedPrefRepository;
  final FertilizerRepository fertilizerRepository;

  CreateSendFertilizerFarmer(
      {required this.sharedPrefRepository, required this.fertilizerRepository});
  @override
  Future<Result<DistributionFertilizerFarmer>> call(
      SendFarmerParams params) async {
    final DateTime date = DateTime.now();
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await fertilizerRepository.createDistributionFarmer(
        idGroupFarmer: user![1],
        idUserFarmer: params.idUserFarmer,
        idPPL: user[2],
        farmerName: params.farmerName,
        year: params.year,
        distribution: params.distribution,
        distribusiDate: DateFormat("dd-mm-yy").format(date),
        ureaDistribution: params.ureaDistribution,
        poskaDistribution: params.poskaDistribution);
    print("object");
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message),
    };
  }
}
