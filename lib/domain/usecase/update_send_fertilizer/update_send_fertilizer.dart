import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/update_send_fertilizer/update_send_fertilizer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateSendFertilizer
    implements UseCase<Result<String>, UpdateSendFertilizerParams> {
  final SubmissionFretilizerRepository submission;

  UpdateSendFertilizer({required this.submission});

  @override
  Future<Result<String>> call(UpdateSendFertilizerParams params) async {
    final DateTime date = DateTime.now();
    var result = await submission.updateSendFertilizer(
        idDocument: params.idDocument,
        ureaSend: params.ureaSend,
        poskaSend: params.poskaSend,
        datesend: DateFormat("dd-mm-yy").format(date),
        sendName: params.sendName,
        recipientName: params.recipientName);
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
