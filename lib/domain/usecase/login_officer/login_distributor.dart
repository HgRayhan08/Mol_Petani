import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/user_repository_petugas.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class LoginDistributor implements UseCase<Result<User>, LoginParams> {
  final Authentication _authentication;
  final UserRepositoryPetugas _userRepository;

  LoginDistributor(
      {required Authentication authentication,
      required UserRepositoryPetugas userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await _authentication.login(
        email: params.email, password: params.password);
    if (idResult.isSuccess) {
      var dataResult =
          await _userRepository.getUserDistributor(uid: idResult.resultValue!);
      return switch (dataResult) {
        Success(value: final user) => Result.success(user),
        Failed(message: final message) => Result.failed(message),
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
