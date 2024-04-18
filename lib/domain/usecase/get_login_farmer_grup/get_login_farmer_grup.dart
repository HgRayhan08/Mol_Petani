import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetLoginFarmerGrup implements UseCase<Result<UserFarmerGroup>, void> {
  final UserRepository _userRepository;
  final SharedPrefRepository _sharedPrefRepository;
  GetLoginFarmerGrup({
    required Authentication authenticationRef,
    required UserRepository userRepository,
    required SharedPrefRepository sharedPrefRepository,
  })  : _userRepository = userRepository,
        _sharedPrefRepository = sharedPrefRepository;

  @override
  Future<Result<UserFarmerGroup>> call(void _) async {
    List<String>? loginId = await _sharedPrefRepository.getDataLogin();
    if (loginId != null) {
      var resultUser = await _userRepository.getUserFarmerGrup(uid: loginId[1]);
      if (resultUser.isSuccess) {
        return Result.success(resultUser.resultValue!);
      } else {
        return Result.failed(resultUser.errorMessage!);
      }
    } else {
      return const Result.failed("Data Petani tidak ditemukan");
    }
  }
}
