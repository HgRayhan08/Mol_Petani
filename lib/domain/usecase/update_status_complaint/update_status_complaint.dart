import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateStstusComplaint implements UseCase<Result<String>, String> {
  final ReportRepository reportRepository;

  UpdateStstusComplaint({required this.reportRepository});

  @override
  Future<Result<String>> call(String params) async {
    var result =
        await reportRepository.updateStatusComplaint(idDocument: params);
    return switch (result) {
      Success() => const Result.success("Succes update data"),
      Failed(:final message) => Result.failed(message),
    };
  }
}
