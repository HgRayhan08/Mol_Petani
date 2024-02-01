import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository_petugas.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetLoginGrup implements UseCase<Result<User>, void> {
  // final Authentication _authentication;
  final UserRepositoryPetugas _userRepository;
  final SharedPrefRepository _sharedPrefRepository;
  GetLoginGrup({
    required Authentication authenticationRef,
    required UserRepositoryPetugas userRepository,
    required SharedPrefRepository sharedPrefRepository,
  })  :
        // _authentication = authenticationRef,
        _userRepository = userRepository,
        _sharedPrefRepository = sharedPrefRepository;

  @override
  Future<Result<User>> call(void _) async {
    // String? loginId = _authentication.getLoginPetugas();
    List<String>? loginId = await _sharedPrefRepository.getDataLogin();
    if (loginId != null) {
      var resultUser = await _userRepository.getUserGrup(uid: loginId[1]);
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
