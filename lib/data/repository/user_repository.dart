import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUserPetugas({
    required String uid,
    required String nama,
    required String email,
    required String collection,
    String? fotoUrl,
    required String keterangan,
    List<String>? cangkupan,
    String? kelompok,
  });
  Future<Result<User>> getUserPpl({required String uid});
  Future<Result<User>> getUserDistributor({required String uid});
  Future<Result<User>> getUserKelompok({required String uid});
}
