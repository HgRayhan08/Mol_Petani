import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/create_send_fertilizer_group/send_group_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateSendFertilizerGroup
    implements UseCase<Result<SubmissionKuotaFertilizer>, SendGroupParams> {
  final UserRepository userRepository;
  final FertilizerRepository fertilizerRepository;
  final SharedPrefRepository sharedPrefRepository;

  CreateSendFertilizerGroup(
      {required this.userRepository,
      required this.fertilizerRepository,
      required this.sharedPrefRepository});

  @override
  Future<Result<SubmissionKuotaFertilizer>> call(SendGroupParams params) async {
    DateTime date = DateTime.now();
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var dataGrupFarmer =
        await userRepository.getUserFarmerGrup(uid: params.idGroupFarmer);
    var result = await fertilizerRepository.createSendFertilizerGroup(
        idPPL: user![3],
        idGroupFarmer: params.idGroupFarmer,
        idDistributor: user[1],
        sendDate: DateFormat("dd-MM-yyyy").format(date).toString(),
        leaderName: dataGrupFarmer.resultValue!.leaderName,
        nameDistributor: params.nameDistributor,
        nameGroupFarmer: dataGrupFarmer.resultValue!.farmerGrup,
        year: params.year,
        send: params.send,
        sendUrea: params.sendUrea,
        sendPoska: params.sendPoska);

    return switch (result) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
