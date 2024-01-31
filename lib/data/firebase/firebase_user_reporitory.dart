import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mol_petani/data/repository/user_repository_petugas.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';

class FirebaseUserRepository implements UserRepositoryPetugas {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  // @override
  // Future<Result<User>> createUserofficer({
  //   required String uid,
  //   required String nama,
  //   required String email,
  //   required String keterangan,
  //   required String desa,
  //   String? fotoUrl,
  //   List<String>? cangkupan,
  //   String? kelompok,
  //   required String collection,
  // }) async {
  //   CollectionReference<Map<String, dynamic>> users =
  //       _firebaseFirestore.collection(collection);
  //   await users.doc(uid).set({
  //     "uid": uid,
  //     "nama": nama,
  //     "email": email,
  //     "keterangan": keterangan,
  //     "fotoUrl": fotoUrl,
  //     "cangkupan": cangkupan,
  //     "kelompok": kelompok,
  //     "desa": desa
  //   });

  //   DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
  //   if (result.exists) {
  //     return Result.success(User.fromJson(result.data()!));
  //   } else {
  //     return const Result.failed("Gagal untuk Membuat create data");
  //   }
  // }

  @override
  Future<Result<User>> createUserPpl(
      {required String uid,
      required String nama,
      required String email,
      String? fotoUrl,
      required String keterangan,
      List<String>? cangkupan,
      String? kecamatan}) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection("userPPl");
    await users.doc(uid).set({
      "uid": uid,
      "nama": nama,
      "email": email,
      "keterangan": keterangan,
      "fotoUrl": fotoUrl,
      "cangkupan": cangkupan,
      "kecamatan": kecamatan,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed("Gagal untuk Membuat create account ppl");
    }
  }

  @override
  Future<Result<User>> createUserGrupFarmer({
    required String uid,
    required String nama,
    required String email,
    String? fotoUrl,
    required String keterangan,
    required String desa,
    String? kelompok,
    String? idPPl,
  }) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection("user_kelompok_tani");
    await users.doc(uid).set({
      "uid": uid,
      "nama": nama,
      "email": email,
      "keterangan": keterangan,
      "fotoUrl": fotoUrl,
      "kelompok": kelompok,
      "desa": desa
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed(
          "Gagal untuk Membuat create account grup farmer");
    }
  }

  @override
  Future<Result<User>> createUserDistributor(
      {required String uid,
      required String nama,
      required String email,
      String? fotoUrl,
      required String keterangan,
      List<String>? cangkupan,
      String? idPPl}) async {
    CollectionReference<Map<String, dynamic>> users =
        _firebaseFirestore.collection("user_Distributor");
    await users.doc(uid).set({
      "uid": uid,
      "nama": nama,
      "email": email,
      "keterangan": keterangan,
      "fotoUrl": fotoUrl,
      "cangkupan": cangkupan,
      "idPPl": idPPl,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed(
          "Gagal untuk Membuat create account Distributor");
    }
  }

  @override
  Future<Result<User>> getUserPpl({
    required String uid,
  }) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("userPPl/$uid");

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed("User nnot Found");
    }
  }

  @override
  Future<Result<User>> getUserDistributor({required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("user_Distributor/$uid");
    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed("User Distributor Not Found");
    }
  }

  @override
  Future<Result<User>> getUserGrup({required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("user_kelompok_tani/$uid");
    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed("User Kelompok Tani Not Found");
    }
  }
}
