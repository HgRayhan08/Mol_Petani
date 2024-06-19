import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/get_grup_farmer/group_farmer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetAllGrupFarmer
    implements UseCase<Result<List<UserFarmerGroup>>, GroupFarmerParams> {
  final UserRepository userRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetAllGrupFarmer(
      {required this.userRepository, required this.sharedPrefRepository});

  @override
  Future<Result<List<UserFarmerGroup>>> call(GroupFarmerParams params) async {
    List<String>? idPPl = await sharedPrefRepository.getDataLogin();
    var data =
        await userRepository.getAllFarmerGrup(idppl: idPPl![params.idPPL]);
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message)
    };
  }
}
