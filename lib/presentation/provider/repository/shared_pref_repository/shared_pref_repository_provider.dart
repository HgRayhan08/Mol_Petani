import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/shered_preference/shered_preference.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "shared_pref_repository_provider.g.dart";

@riverpod
SharedPrefRepository sharedPrefRepository(SharedPrefRepositoryRef ref) =>
    SharedPreference();
