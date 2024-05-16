import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_member_farmer_group/create_member_farmer_group_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateMemberFarmerGroup
    implements UseCase<Result<String>, CreateMemberFarmerGroupParams> {
  final UserRepository userRepository;
  final Authentication authentication;
  final SharedPrefRepository sharedPrefRepository;

  CreateMemberFarmerGroup(
      {required this.userRepository,
      required this.authentication,
      required this.sharedPrefRepository});

  @override
  Future<Result<String>> call(CreateMemberFarmerGroupParams params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    // print(user![1]);
    var updateData = await userRepository.addMemberFarmergroup(
      idDocument: params.idDocument,
      idFarmerGroup: user![1],
      grupFarmer: user[3],
      idPPL: user[2],
    );
    if (updateData.isSuccess) {
      return const Result.success("Update is Succes");
    } else {
      return const Result.failed("update is Failed");
    }
  }
}
