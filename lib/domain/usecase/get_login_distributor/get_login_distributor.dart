import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetLoginDistributor implements UseCase<Result<UserDistrubutor>, void> {
  final UserRepository _userRepository;
  final SharedPrefRepository _sharedPrefRepository;

  GetLoginDistributor(
      {required Authentication authentication,
      required UserRepository userRepository,
      required SharedPrefRepository sharedPrefRepository})
      : _userRepository = userRepository,
        _sharedPrefRepository = sharedPrefRepository;

  @override
  Future<Result<UserDistrubutor>> call(void _) async {
    List<String>? loginId = await _sharedPrefRepository.getDataLogin();
    if (loginId != null) {
      var resultUser = await _userRepository.getUserDistributor(
        uid: loginId[1],
      );
      if (resultUser.isSuccess) {
        return Result.success(resultUser.resultValue!);
      } else {
        return Result.failed(resultUser.errorMessage!);
      }
    } else {
      return const Result.failed("Data User Tidak Ditemukan");
    }
  }
}
