import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class LoginDistributor implements UseCase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;
  final SharedPrefRepository sharedPrefRepository;

  LoginDistributor(
      {required this.authentication,
      required this.userRepository,
      required this.sharedPrefRepository});

  @override
  Future<Result<User>> call(LoginParams params) async {
    var idResult = await authentication.login(
        email: params.email, password: params.password);
    if (idResult.isSuccess) {
      var dataResult =
          await userRepository.getUserDistributor(uid: idResult.resultValue!);
      if (dataResult.isSuccess) {
        await sharedPrefRepository.saveDataLogin(
            [dataResult.resultValue!.keterangan, dataResult.resultValue!.uid]);
        return switch (dataResult) {
          Success(value: final user) => Result.success(user),
          Failed(message: final message) => Result.failed(message),
        };
      } else {
        return Result.failed(dataResult.errorMessage!);
      }
    } else {
      return Result.failed(idResult.errorMessage!);
    }
  }
}
