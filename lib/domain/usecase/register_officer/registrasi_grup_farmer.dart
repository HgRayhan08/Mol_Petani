import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository_petugas.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/register_officer/register_petugas_param.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class RegisterGrupFarmer
    implements UseCase<Result<User>, RegisterOfficerParam> {
  final Authentication _authentication;
  final UserRepositoryPetugas _userRepository;
  final SharedPrefRepository _sharedPrefRepository;

  RegisterGrupFarmer({
    required Authentication authentication,
    required UserRepositoryPetugas userRepository,
    required SharedPrefRepository sharedPrefRepository,
  })  : _authentication = authentication,
        _userRepository = userRepository,
        _sharedPrefRepository = sharedPrefRepository;

  @override
  Future<Result<User>> call(RegisterOfficerParam params) async {
    var createAkun = await _authentication.register(
        email: params.email, password: params.password);
    if (createAkun.isSuccess) {
      List<String>? loginId = await _sharedPrefRepository.getDataLogin();
      var createData = await _userRepository.createUserGrupFarmer(
        uid: createAkun.resultValue!,
        nama: params.nama,
        email: params.email,
        keterangan: params.keterangan,
        fotoUrl: params.fotoUrl!,
        kelompok: params.kelompok!,
        desa: params.desa!,
        idPPl: loginId![1],
      );

      if (createData.isSuccess) {
        var resultUser = await _userRepository.getUserPpl(
          uid: loginId[1],
        );
        if (resultUser.isSuccess) {
          return Result.success(resultUser.resultValue!);
        } else {
          return Result.failed(resultUser.errorMessage!);
        }
      } else {
        return Result.failed(createData.errorMessage!);
      }
    } else {
      return Result.failed(createAkun.errorMessage!);
    }
  }
}
