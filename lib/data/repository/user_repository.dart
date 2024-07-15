import 'dart:io';
import 'dart:typed_data';

import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/domain/entities/user_ppl.dart';

abstract interface class UserRepository {
  // Future<Result<User>> createUserPpl({
  //   required String uid,
  //   required String nama,
  //   required String email,
  //   String? fotoUrl,
  //   required String keterangan,
  //   List<String>? cangkupan,
  //   String? kecamatan,
  // });

  Future<Result<UserFarmerGroup>> createUserFarmerGrup(
      {required String uid,
      required String leaderName,
      required String email,
      required String information,
      required String familyIdentificationNumber,
      String? fotoUrl,
      required String farmerGrup,
      required String village,
      required String idPPL,
      required int mobileNumber});

  Future<Result<UserDistrubutor>> createUserDistributor(
      {required String uid,
      required String name,
      required String email,
      required String information,
      required String familyIdentificationNumber,
      required String idPPL,
      String? fotoUrl,
      required String toko,
      required String address,
      required List<String> scope,
      required int mobileNumber});

  Future<Result<UserFarmer>> createFarmer({
    required String name,
    required String village,
    required String nik,
    required String kartuKeluarga,
    required String luasLahan,
    required String jenisKelamin,
    required String noHp,
    required String dateOfBirth,
  });

  Future<Result<UserPpl>> getUserPpl({required String uid});
  Future<Result<UserDistrubutor>> getUserDistributor({required String uid});
  Future<Result<UserFarmerGroup>> getUserFarmerGrup({required String uid});
  Future<Result<UserFarmer>> getUserFarmer({required String idUser});
  Future<Result<List<UserFarmerGroup>>> getAllFarmerGrup(
      {required String idppl});
  Future<Result<List<UserDistrubutor>>> getAllDistributor(
      {required String idppl});
  Future<Result<List<UserFarmer>>> getAllFarmer();
  Future<Result<List<UserFarmer>>> getAllMemberFarmerGroup({
    required String idFarmerGroup,
  });

  Future<String> uploadImage({required File imageFile});
  Future<String> uploadImageWeb(
      {required String imageFile, required Uint8List webFile});

  Future<Result<String>> updateAccountFarmer({
    required String idDocument,
    required String email,
    required String idUserFarmer,
  });

  Future<Result<String>> addMemberFarmergroup({
    required String idDocument,
    required String idFarmerGroup,
    required String grupFarmer,
    required String idPPL,
  });

  Future<Result<String>> deleteDistributor({required String idDocument});
  Future<Result<String>> deleteFarmerGroup({required String idDocument});
  Future<Result<String>> deleteFarmer({required String idDocument});
}
