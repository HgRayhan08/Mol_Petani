import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/upate_reception_fertilizer/reception_fertilizer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateReceptionFertilizer
    implements UseCase<Result<String>, ReceptionFertilizerParams> {
  final FertilizerRepository submission;

  UpdateReceptionFertilizer({required this.submission});

  @override
  Future<Result<String>> call(ReceptionFertilizerParams params) async {
    final DateTime date = DateTime.now();
    var result = await submission.updateReceptionFertilizer(
        idDocument: params.idDocument,
        ureaPickup: params.acceptUrea,
        poskaPickup: params.acceptPoska,
        plant: params.plant,
        pickupDate: DateFormat("dd-mm-yy").format(date));
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
