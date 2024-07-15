import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class DeleteComplaint implements UseCase<Result<String>, String> {
  final ReportRepository reportRepository;

  DeleteComplaint({required this.reportRepository});

  @override
  Future<Result<String>> call(String params) async {
    final result = await reportRepository.deleteComplaint(idDocument: params);
    return switch (result) {
      Success() => const Result.success("Document deleted successfully"),
      Failed(:final message) => Result.failed(message),
    };
  }
}
