import 'package:mol_petani/data/firebase/firebase_user_reporitory.dart';
import 'package:mol_petani/data/repository/user_repository_petugas.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_petugas_provider.g.dart';

@riverpod
UserRepositoryPetugas userRepositoryPetugas(UserRepositoryPetugasRef ref) =>
    FirebaseUserRepository();
