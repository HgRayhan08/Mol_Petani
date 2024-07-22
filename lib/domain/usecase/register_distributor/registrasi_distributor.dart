import 'package:flutter/foundation.dart';
import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_ppl.dart';
import 'package:mol_petani/domain/usecase/register_distributor/register_distributor_parms.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class RegisterDistributor
    implements UseCase<Result<UserPpl>, RegisterDistributorParams> {
  final Authentication _authentication;
  final UserRepository _userRepository;
  final SharedPrefRepository _sharedPrefRepository;

  RegisterDistributor(
      {required Authentication authentication,
      required UserRepository userRepository,
      required SharedPrefRepository sharedPrefRepository})
      : _authentication = authentication,
        _userRepository = userRepository,
        _sharedPrefRepository = sharedPrefRepository;

  @override
  Future<Result<UserPpl>> call(RegisterDistributorParams params) async {
    var createAkun = await _authentication.register(
        email: params.email, password: params.password);
    if (createAkun.isSuccess) {
      if (kIsWeb) {
        String image = await _userRepository.uploadImageWeb(
            imageFile: params.fotoUrl.path, webFile: params.webfotourl!);
        if (image.isNotEmpty) {
          List<String>? loginId = await _sharedPrefRepository.getDataLogin();
          var createData = await _userRepository.createUserDistributor(
            uid: createAkun.resultValue!,
            name: params.name,
            email: params.email,
            information: "Distributor",
            fotoUrl: image,
            toko: params.toko,
            scope: params.scope,
            idPPL: loginId![1],
            address: params.address,
            familyIdentificationNumber: params.familyIdentificationNumber,
            mobileNumber: params.mobileNumber,
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
          return const Result.failed("error platform web");
        }
      } else {
        String image =
            await _userRepository.uploadImage(imageFile: params.fotoUrl);
        if (image.isNotEmpty) {
          List<String>? loginId = await _sharedPrefRepository.getDataLogin();
          var createData = await _userRepository.createUserDistributor(
            uid: createAkun.resultValue!,
            name: params.name,
            email: params.email,
            information: "Distributor",
            fotoUrl: image.toString(),
            toko: params.toko,
            scope: params.scope,
            idPPL: loginId![1],
            address: params.address,
            familyIdentificationNumber: params.familyIdentificationNumber,
            mobileNumber: params.mobileNumber,
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
          return const Result.failed("error platform mobile");
        }
      }
    } else {
      return Result.failed(createAkun.errorMessage!);
    }
  }
}
