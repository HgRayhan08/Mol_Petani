import 'package:flutter/foundation.dart';
import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_ppl.dart';
import 'package:mol_petani/domain/usecase/register_ppl/ppl_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class RegisterPpl implements UseCase<Result<UserPpl>, PplParams> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  RegisterPpl({
    required Authentication authentication,
    required UserRepository userRepository,
  })  : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<UserPpl>> call(PplParams params) async {
    var createAkun = await _authentication.register(
        email: params.email, password: params.password);
    if (createAkun.isSuccess) {
      if (kIsWeb) {
        String image = await _userRepository.uploadImageWeb(
            imageFile: params.fotoUrl!.path, webFile: params.webfotourl!);
        if (image.isNotEmpty) {
          print("upload image is sucsess");
          var createData = await _userRepository.createUserPpl(
              uid: createAkun.resultValue!,
              nama: params.nama,
              email: params.email,
              keterangan: "Penyuluh Pertanian Lapangan",
              cangkupan: params.cangkupan,
              fotoUrl: image,
              nik: params.nik,
              kecamatan: params.kecamatan);

          if (createData.isSuccess) {
            return Result.success(createData.resultValue!);
          } else {
            return Result.failed(createData.errorMessage!);
          }
        } else {
          return const Result.failed("error platform web");
        }
      } else {
        String imageMobile =
            await _userRepository.uploadImage(imageFile: params.fotoUrl!);
        if (imageMobile.isNotEmpty) {
          var createData = await _userRepository.createUserPpl(
              uid: createAkun.resultValue!,
              nama: params.nama,
              email: params.email,
              keterangan: "Penyuluh Pertanian Lapangan",
              cangkupan: params.cangkupan,
              fotoUrl: imageMobile,
              nik: params.nik,
              kecamatan: params.kecamatan);
          if (createData.isSuccess) {
            return Result.success(createData.resultValue!);
          } else {
            return Result.failed(createData.errorMessage!);
          }
        } else {
          return const Result.failed("error platform mobile");
        }
      }
    } else {
      return Result.failed(createAkun.errorMessage!);
    }
  }
}
