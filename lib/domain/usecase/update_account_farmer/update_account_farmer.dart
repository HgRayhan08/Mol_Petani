import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/update_account_farmer/update_accoun_farmer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class UpdateAccountFarmer
    implements UseCase<Result<String>, UpdateAccountFarmerParams> {
  final UserRepository userRepository;
  final Authentication authentication;

  UpdateAccountFarmer({
    required this.userRepository,
    required this.authentication,
  });

  @override
  Future<Result<String>> call(UpdateAccountFarmerParams params) async {
    var createAccount = await authentication.register(
        email: params.email, password: params.password);

    if (createAccount.isSuccess) {
      var updateData = await userRepository.updateAccountFarmer(
        idDocument: params.idDocument,
        email: params.email,
        idUserFarmer: createAccount.resultValue!,
      );
      if (updateData.isSuccess) {
        return const Result.success("Update is Succes");
      } else {
        return const Result.failed("update is Failed");
      }
    } else {
      return const Result.failed("failed create account");
    }
  }
}
