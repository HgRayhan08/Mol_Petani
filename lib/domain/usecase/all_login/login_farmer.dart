import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/usecase/all_login/login_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class LoginFarmer implements UseCase<Result<UserFarmer>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;
  final SharedPrefRepository sharedPrefRepository;

  LoginFarmer({
    required this.authentication,
    required this.userRepository,
    required this.sharedPrefRepository,
  });

  @override
  Future<Result<UserFarmer>> call(LoginParams params) async {
    var loginResult = await authentication.login(
        email: params.email, password: params.password);
    if (loginResult.isSuccess) {
      var userResult =
          await userRepository.getUserFarmer(idUser: loginResult.resultValue!);
      if (userResult.isSuccess) {
        print(userResult.resultValue!.idUserFarmer);
        await sharedPrefRepository.saveDataLogin({
          userResult.resultValue!.information,
          userResult.resultValue!.idUserFarmer,
          userResult.resultValue!.idPPL,
          userResult.resultValue!.grupFarmer,
          userResult.resultValue!.idGrupFarmer,
          userResult.resultValue!.name,
        }.toList());
        return switch (userResult) {
          Success(value: final user) => Result.success(user),
          Failed(message: final message) => Result.failed(message),
        };
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return const Result.failed("Error Login");
    }
  }
}
