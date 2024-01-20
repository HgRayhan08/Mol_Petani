import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/login_petugas/login_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class LoginPpl implements UseCase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;

  LoginPpl({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await authentication.login(
        email: params.email, password: params.password);
    if (idResult is Success) {
      var userResult =
          await userRepository.getUserPpl(uid: idResult.resultValue!);
      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(message: final message) => Result.failed(message),
      };
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
