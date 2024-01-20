import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/register_petugas/register_petugas_param.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class RegisterPetugas implements UseCase<Result<User>, RegisterPetugasParam> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  RegisterPetugas(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterPetugasParam params) async {
    var createAkun = await _authentication.register(
        email: params.email, password: params.password);
    if (createAkun.isSuccess) {
      var createData = await _userRepository.createUserPetugas(
        uid: createAkun.resultValue!,
        nama: params.nama,
        email: params.email,
        fotoUrl: params.fotoUrl,
        cangkupan: params.cangkupan,
        keterangan: params.keterangan,
        kelompok: params.kelompok,
        collection: params.collection,
      );
      if (createData.isSuccess) {
        return Result.success(createData.resultValue!);
      } else {
        return Result.failed(createData.errorMessage!);
      }
    } else {
      return Result.failed(createAkun.errorMessage!);
    }
  }
}
