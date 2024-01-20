import 'package:mol_petani/data/firebase/firebase_authentication.dart';
import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) =>
    FirebaseAuthentication();
