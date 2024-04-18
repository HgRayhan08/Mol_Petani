import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/upate_accepted_group/update_accepted_group_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateAcceptedGroup
    implements UseCase<Result<String>, UpdateAcceptedGroupparams> {
  final SubmissionFretilizerRepository submission;

  UpdateAcceptedGroup({required this.submission});

  @override
  Future<Result<String>> call(UpdateAcceptedGroupparams params) async {
    final DateTime date = DateTime.now();
    var result = await submission.updateAcceptedFertilizer(
      idDocument: params.idDocument,
      ureaUpdate: params.ureaUpdate,
      poskaUpdate: params.poskaUpdate,
      dateUpdate: DateFormat("dd-mm-yy").format(date),
      sendName: params.sendName,
      recipientName: params.recipientName,
    );
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
