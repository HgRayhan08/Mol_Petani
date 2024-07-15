import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class DeletePest implements UseCase<Result<String>, String> {
  final ReportRepository reportRepository;

  DeletePest({required this.reportRepository});

  @override
  Future<Result<String>> call(String params) async {
    final result = await reportRepository.deletePest(idDocument: params);
    return switch (result) {
      Success() => const Result.success("Document deleted successfully"),
      Failed(:final message) => Result.failed(message),
    };
  }
}
