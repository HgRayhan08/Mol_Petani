import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_ppl.dart';
import 'package:mol_petani/domain/usecase/register_farmer_grup/register_farmer_grup_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class RegisterFarmerGrup
    implements UseCase<Result<UserPpl>, RegisterFarmerGrupParams> {
  final Authentication _authentication;
  final UserRepository _userRepository;
  final SharedPrefRepository _sharedPrefRepository;

  RegisterFarmerGrup({
    required Authentication authentication,
    required UserRepository userRepository,
    required SharedPrefRepository sharedPrefRepository,
  })  : _authentication = authentication,
        _userRepository = userRepository,
        _sharedPrefRepository = sharedPrefRepository;

  @override
  Future<Result<UserPpl>> call(RegisterFarmerGrupParams params) async {
    var createAkun = await _authentication.register(
        email: params.email, password: params.password);
    if (createAkun.isSuccess) {
      String image =
          await _userRepository.uploadImage(imageFile: params.fotoUrl);
      if (image.isNotEmpty) {
        List<String>? loginId = await _sharedPrefRepository.getDataLogin();
        var createData = await _userRepository.createUserFarmerGrup(
          uid: createAkun.resultValue!,
          name: params.name,
          leaderName: params.leaderName,
          email: params.email,
          information: "Kelompok Tani",
          fotoUrl: image.toString(),
          familyIdentificationNumber: params.familyIdentificationNumber,
          village: params.village,
          farmerGrup: params.farmerGrup,
          idPPL: loginId![1],
          mobileNumber: params.mobileNumber,
        );

        if (createData.isSuccess) {
          // memasukkan data ppl
          var resultUserPpl = await _userRepository.getUserPpl(
            uid: loginId[1],
          );
          if (resultUserPpl.isSuccess) {
            return Result.success(resultUserPpl.resultValue!);
          } else {
            return Result.failed(resultUserPpl.errorMessage!);
          }
        } else {
          return Result.failed(createData.errorMessage!);
        }
      } else {
        return const Result.failed("message");
      }
    } else {
      return Result.failed(createAkun.errorMessage!);
    }
  }
}
