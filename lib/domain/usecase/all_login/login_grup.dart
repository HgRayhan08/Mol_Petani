import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/all_login/login_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class LoginFarmerGrup implements UseCase<Result<UserFarmerGroup>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;
  final SharedPrefRepository sharedPrefRepository;

  LoginFarmerGrup({
    required this.authentication,
    required this.userRepository,
    required this.sharedPrefRepository,
  });

  @override
  Future<Result<UserFarmerGroup>> call(LoginParams params) async {
    var idResult = await authentication.login(
        email: params.email, password: params.password);
    if (idResult.isSuccess) {
      var userResult =
          await userRepository.getUserFarmerGrup(uid: idResult.resultValue!);
      if (userResult.isSuccess) {
        await sharedPrefRepository.saveDataLogin([
          userResult.resultValue!.information,
          userResult.resultValue!.uid,
          userResult.resultValue!.idPPL,
          userResult.resultValue!.farmerGrup,
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
