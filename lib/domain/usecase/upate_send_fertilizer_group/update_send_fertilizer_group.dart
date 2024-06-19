import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/upate_send_fertilizer_group/accept_fertilizer_group.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateSendFertilizerGroup
    implements UseCase<Result<String>, AcceptFertilizerGroup> {
  final FertilizerRepository submission;

  UpdateSendFertilizerGroup({required this.submission});

  @override
  Future<Result<String>> call(AcceptFertilizerGroup params) async {
    final DateTime date = DateTime.now();
    var result = await submission.updateSendFertilizer(
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
