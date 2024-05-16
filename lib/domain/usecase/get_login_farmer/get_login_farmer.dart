import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetLoginFarmer implements UseCase<Result<UserFarmer>, void> {
  final UserRepository _userRepository;
  final SharedPrefRepository _sharedPrefRepository;

  GetLoginFarmer(
      {required UserRepository userRepository,
      required SharedPrefRepository sharedPrefRepository})
      : _userRepository = userRepository,
        _sharedPrefRepository = sharedPrefRepository;
  @override
  Future<Result<UserFarmer>> call(void _) async {
    List<String>? user = await _sharedPrefRepository.getDataLogin();

    if (user != null) {
      var result = await _userRepository.getUserFarmer(idUser: user[1]);
      if (result.isSuccess) {
        return Result.success(result.resultValue!);
      } else {
        return Result.failed(result.errorMessage!);
      }
    } else {
      return const Result.failed("Data User Todak Ditemukan");
    }
  }
}
