import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/domain/entities/user_ppl.dart';
import 'package:path/path.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  // @override
  // Future<Result<User>> createUserPpl(
  //     {required String uid,
  //     required String nama,
  //     required String email,
  //     String? fotoUrl,
  //     required String keterangan,
  //     List<String>? cangkupan,
  //     String? kecamatan}) async {
  //   CollectionReference<Map<String, dynamic>> users =
  //       _firebaseFirestore.collection("User_Penyuluh_Pertanian_Lapangan");
  //   await users.doc(uid).set({
  //     "uid": uid,
  //     "nama": nama,
  //     "email": email,
  //     "keterangan": keterangan,
  //     "fotoUrl": fotoUrl,
  //     "cangkupan": cangkupan,
  //     "kecamatan": kecamatan,
  //   });

  //   DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
  //   if (result.exists) {
  //     return Result.success(User.fromJson(result.data()!));
  //   } else {
  //     return const Result.failed("Gagal untuk Membuat create account ppl");
  //   }
  // }

  @override
  Future<Result<UserFarmerGroup>> createUserFarmerGrup(
      {required String uid,
      required String name,
      required String email,
      required String information,
      required String familyIdentificationNumber,
      String? fotoUrl,
      required String farmerGrup,
      required String village,
      required String idPPL,
      required int mobileNumber}) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection("User_Farmer_Grup");
    await users.doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
      "information": information,
      "familyIdentificationNumber": familyIdentificationNumber,
      "fotoUrl": fotoUrl,
      "farmerGrup": farmerGrup,
      "village": village,
      "idPPL": idPPL,
      "mobileNumber": mobileNumber
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
    if (result.exists) {
      return Result.success(UserFarmerGroup.fromJson(result.data()!));
    } else {
      return const Result.failed(
          "Gagal untuk Membuat create account grup farmer");
    }
  }

  @override
  Future<Result<UserDistrubutor>> createUserDistributor({
    required String uid,
    required String name,
    required String email,
    required String information,
    required String familyIdentificationNumber,
    required String idPPL,
    String? fotoUrl,
    required String address,
    required List<String> scope,
    required int mobileNumber,
  }) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection("User_Distributor");
    await users.doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
      "information": information,
      "fotoUrl": fotoUrl,
      "scope": scope,
      "idPPL": idPPL,
      "familyIdentificationNumber": familyIdentificationNumber,
      "address": address,
      "mobileNumber": mobileNumber,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
    if (result.exists) {
      return Result.success(UserDistrubutor.fromJson(result.data()!));
    } else {
      return const Result.failed(
          "Gagal untuk Membuat create account Distributor");
    }
  }

  @override
  Future<Result<UserFarmer>> createFarmer({
    required String idGrupFarmer,
    required String nama,
    required String village,
    required String nik,
    required String kartuKeluarga,
    required String luasLahan,
    required String jenisKelamin,
  }) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection("User_Farmer");

    await users.doc().set({
      "idGrupFarmer": idGrupFarmer,
      "idUserFarmer": "",
      "nama": nama,
      "grupFarmer": "",
      "village": village,
      "email": "",
      "nik": nik,
      "kartuKeluarga": kartuKeluarga,
      "luasLahan": luasLahan,
      "jenisKelamin": jenisKelamin,
    });
    DocumentSnapshot<Map<String, dynamic>> result = await users.doc().get();
    if (result.exists) {
      return Result.success(UserFarmer.fromJson(result.data()!));
    } else {
      return const Result.failed(
          "Gagal untuk Membuat create account Distributor");
    }
  }

  @override
  Future<Result<UserPpl>> getUserPpl({
    required String uid,
  }) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("User_Penyuluh_Pertanian_Lapangan/$uid");

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      return Result.success(UserPpl.fromJson(result.data()!));
    } else {
      return const Result.failed("User nnot Found");
    }
  }

  @override
  Future<Result<UserDistrubutor>> getUserDistributor(
      {required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("User_Distributor/$uid");
    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();
    if (result.exists) {
      return Result.success(UserDistrubutor.fromJson(result.data()!));
    } else {
      return const Result.failed("User Distributor Not Found");
    }
  }

  @override
  Future<Result<UserFarmerGroup>> getUserFarmerGrup(
      {required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("User_Farmer_Grup/$uid");
    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      return Result.success(UserFarmerGroup.fromJson(result.data()!));
    } else {
      return const Result.failed("User Kelompok Tani Not Found");
    }
  }

  @override
  Future<Result<List<UserFarmerGroup>>> getAllFarmerGrup(
      {required String idppl}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("User_Farmer_Grup");

    try {
      var result = await data.where("idPPL", isEqualTo: idppl).get();
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs
              .map(
                (e) => UserFarmerGroup(
                    uid: e["uid"],
                    name: e["name"],
                    email: e["email"],
                    information: e["information"],
                    familyIdentificationNumber: e["familyIdentificationNumber"],
                    village: e["village"],
                    fotoUrl: e["fotoUrl"],
                    farmerGrup: e["farmerGrup"],
                    idPPL: e["idPPL"],
                    mobileNumber: e["mobileNumber"]),
              )
              .toList(),
        );
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(" $e");
    }
  }

  @override
  Future<Result<List<UserDistrubutor>>> getAllDistributor(
      {required String idppl}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("User_Distributor");

    try {
      var result = await data.where("idPPL", isEqualTo: idppl).get();
      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map(
              (e) => UserDistrubutor(
                uid: e["uid"],
                name: e["name"],
                email: e["email"],
                information: e["information"],
                familyIdentificationNumber: e["familyIdentificationNumber"],
                idPPL: e["idPPL"],
                fotoUrl: e["fotoUrl"],
                address: e["address"],
                scope: e["scope"],
                mobileNumber: e["mobileNumber"],
              ),
            )
            .toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(" $e");
    }
  }

  @override
  Future<String> uploadImage({required File imageFile}) async {
    String fileName = basename(imageFile.path);

    Reference reference = FirebaseStorage.instance.ref().child(fileName);

    try {
      await reference.putFile(imageFile);
      String dowloadUrl = await reference.getDownloadURL();
      if (dowloadUrl.isNotEmpty) {
        return dowloadUrl;
      } else {
        return "Falled Upload Image";
      }
    } catch (e) {
      return "Falled poll";
    }
  }

  @override
  Future<String> updateInformationFarmer({
    required String idDocument,
    required String email,
    required String idFarmer,
    required String grupFarmer,
  }) {
    // TODO: implement updateInformationFarmer
    throw UnimplementedError();
  }
}
