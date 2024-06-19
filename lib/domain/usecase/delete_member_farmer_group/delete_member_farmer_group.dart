import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_member_farmer_group/create_member_farmer_group_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class DeleteMemberFarmerGroup
    implements UseCase<Result<String>, CreateMemberFarmerGroupParams> {
  final UserRepository userRepository;

  DeleteMemberFarmerGroup({
    required this.userRepository,
  });

  @override
  Future<Result<String>> call(CreateMemberFarmerGroupParams params) async {
    var updateData = await userRepository.addMemberFarmergroup(
      idDocument: params.idDocument,
      idFarmerGroup: "",
      grupFarmer: "",
      idPPL: "",
    );
    if (updateData.isSuccess) {
      return const Result.success("Update is Succes");
    } else {
      return const Result.failed("update is Failed");
    }
  }
}
