import 'package:firebase_auth/firebase_auth.dart';
import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:mol_petani/domain/entities/result.dart';

class FirebaseAuthentication implements Authentication {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  String? getLoginPetugas() => _firebaseAuth.currentUser?.uid;

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    try {
      var userLogin = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Result.success(userLogin.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<void>> logout() async {
    await _firebaseAuth.signOut();
    if (_firebaseAuth.currentUser == null) {
      return const Result.success("logout");
    } else {
      return const Result.failed("Gagal melakukan log out");
    }
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) async {
    try {
      var userRegistrasi = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseAuth.signOut();
      return Result.success(userRegistrasi.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed("${e.message}");
    }
  }
}
