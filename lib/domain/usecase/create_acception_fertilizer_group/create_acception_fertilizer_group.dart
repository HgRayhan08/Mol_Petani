import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_acception_fertilizer_group/acception_fertilizer_group_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateAcceptionFertilizerGroup
    implements UseCase<Result<String>, AcceptionFertilizerGroupParams> {
  final FertilizerRepository fertilizerRepository;

  CreateAcceptionFertilizerGroup({required this.fertilizerRepository});
  @override
  Future<Result<String>> call(AcceptionFertilizerGroupParams params) async {
    DateTime date = DateTime.now();
    var result = await fertilizerRepository.updateDistributionFarmer(
        idDocument: params.idDocument,
        acceptUrea: params.acceptUrea,
        acceptPoska: params.acceptPoska,
        acceptDate: DateFormat("dd-MM-yyyy").format(date).toString(),
        nameAcceptGroupFarmer: params.nameAcceptGroupFarmer,
        nameSendDistributor: params.nameSendDistributor);
    return switch (result) {
      Success() => const Result.success("Update is Succses"),
      Failed(:final message) => Result.failed(message),
    };
  }
}
