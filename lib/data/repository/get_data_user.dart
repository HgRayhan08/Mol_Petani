import 'package:mol_petani/domain/entities/result.dart';

abstract interface class GetDataUser {
  Future<void> saveDataUser({required String uid});
  Future<Result<void>> getUser();
  Future<void> removeDataUser();
}
