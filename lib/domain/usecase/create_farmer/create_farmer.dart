import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/usecase/create_farmer/create_farmer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateFarmer implements UseCase<Result<UserFarmer>, CreateFarmerparams> {
  final SharedPrefRepository sharedPrefRepository;
  final UserRepository userRepository;

  CreateFarmer({
    required this.sharedPrefRepository,
    required this.userRepository,
  });

  @override
  Future<Result<UserFarmer>> call(CreateFarmerparams params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await userRepository.createFarmer(
        idGrupFarmer: user![1],
        name: params.name,
        village: params.village,
        nik: params.nik,
        kartuKeluarga: params.kartuKeluarga,
        luasLahan: params.luasLahan,
        jenisKelamin: params.jenisKelamin,
        noHp: '',
        dateOfBirth: '',
        idPPL: user[2],
        grupFarmer: user[3]);
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
