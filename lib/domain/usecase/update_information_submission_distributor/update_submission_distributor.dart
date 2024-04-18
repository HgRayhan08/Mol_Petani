import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/update_information_submission_distributor/update_submission_distributor_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateSubmissionDistributor
    implements UseCase<Result<String>, UpdateSubmissionDistributorParams> {
  final SubmissionFretilizerRepository submission;

  UpdateSubmissionDistributor({required this.submission});

  @override
  Future<Result<String>> call(UpdateSubmissionDistributorParams params) async {
    final DateTime date = DateTime.now();
    var result = await submission.updateSubmissionkuota(
        information: "Proses",
        idDocument: params.idDocument,
        prosesDate: DateFormat("dd-mm-yy").format(date));
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
