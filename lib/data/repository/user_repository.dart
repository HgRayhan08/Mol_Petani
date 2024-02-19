import 'dart:io';

import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUserPpl({
    required String uid,
    required String nama,
    required String email,
    String? fotoUrl,
    required String keterangan,
    List<String>? cangkupan,
    String? kecamatan,
  });

  Future<Result<User>> createUserGrupFarmer({
    required String uid,
    required String nama,
    required String email,
    String? fotoUrl,
    required String keterangan,
    required String desa,
    String? kelompok,
    String? idPPl,
  });

  Future<Result<User>> createUserDistributor({
    required String uid,
    required String nama,
    required String email,
    String? fotoUrl,
    required String keterangan,
    List<String>? cangkupan,
    String? idPPl,
  });

  Future<Result<User>> getUserPpl({required String uid});
  Future<Result<User>> getUserDistributor({required String uid});
  Future<Result<User>> getUserGrup({required String uid});

  Future<Result<List<User>>> getAllGrupFarm({required String idppl});
  Future<Result<List<User>>> getAllDistributor({required String idppl});

  Future<Result<String>> uploadImage({required File imageFile});
}
