import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_ppl.dart';
import 'package:mol_petani/domain/usecase/all_login/login_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class LoginPpl implements UseCase<Result<UserPpl>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;
  final SharedPrefRepository sharedPrefRepository;
  LoginPpl({
    required this.authentication,
    required this.userRepository,
    required this.sharedPrefRepository,
  });
  @override
  Future<Result<UserPpl>> call(LoginParams params) async {
    var idResult = await authentication.login(
        email: params.email, password: params.password);
    if (idResult is Success) {
      var userResult =
          await userRepository.getUserPpl(uid: idResult.resultValue!);
      if (userResult.isSuccess) {
        await sharedPrefRepository.saveDataLogin([
          userResult.resultValue!.information,
          userResult.resultValue!.uid,
          userResult.resultValue!.name
        ]);
        return switch (userResult) {
          Success(value: final user) => Result.success(user),
          Failed(message: final message) => Result.failed(message),
        };
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
