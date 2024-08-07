// import 'package:mol_petani/data/repository/Authentication.dart';
// import 'package:mol_petani/data/repository/user_repository_petugas.dart';
// import 'package:mol_petani/domain/entities/result.dart';
// import 'package:mol_petani/domain/entities/user.dart';
// import 'package:mol_petani/domain/usecase/register_officer/register_petugas_param.dart';
// import 'package:mol_petani/domain/usecase/usecase.dart';

// class RegisterOfficer implements UseCase<Result<User>, RegisterOfficerParam> {
//   final Authentication _authentication;
//   final UserRepositoryPetugas _userRepository;

//   RegisterOfficer(
//       {required Authentication authentication,
//       required UserRepositoryPetugas userRepository})
//       : _authentication = authentication,
//         _userRepository = userRepository;

//   @override
//   Future<Result<User>> call(RegisterOfficerParam params) async {
//     var createAkun = await _authentication.register(
//         email: params.email, password: params.password);
//     if (createAkun.isSuccess) {
//       var createData = await _userRepository.createUserofficer(
//         uid: createAkun.resultValue!,
//         nama: params.nama,
//         email: params.email,
//         keterangan: params.keterangan,
//         fotoUrl: params.fotoUrl!,
//         cangkupan: params.cangkupan!,
//         kelompok: params.kelompok!,
//         desa: params.desa!,
//         idPPL: params.idPPl!,
//         collection: params.collection,
//       );
//       if (createData.isSuccess) {
//         return Result.success(createData.resultValue!);
//       } else {
//         return Result.failed(createData.errorMessage!);
//       }
//     } else {
//       return Result.failed(createAkun.errorMessage!);
//     }
//   }
// }
