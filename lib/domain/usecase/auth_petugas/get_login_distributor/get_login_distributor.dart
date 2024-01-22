import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetLoginDistributor implements UseCase<Result<User>, void> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  GetLoginDistributor(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void _) async {
    String? loginId = _authentication.getLoginPetugas();
    if (loginId != null) {
      var resultUser = await _userRepository.getUserDistributor(
        uid: loginId,
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
