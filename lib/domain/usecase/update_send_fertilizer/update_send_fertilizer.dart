import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/update_send_fertilizer/update_sends_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateSendFertilizer
    implements UseCase<Result<String>, UpdateSendsParams> {
  final FertilizerRepository fertilizerRepository;

  UpdateSendFertilizer({required this.fertilizerRepository});

  @override
  Future<Result<String>> call(UpdateSendsParams params) async {
    var result = await fertilizerRepository.updateSendFertilizer(
        send: params.send,
        sendUrea: params.sendUrea,
        sendPoska: params.sendPoska,
        idDocument: params.idDocument);
    return switch (result) {
      Success() => const Result.success("Update Succes"),
      Failed(:final message) => Result.failed(message)
    };
  }
}
