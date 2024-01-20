import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/get_login_petugas/get_login_petugas.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/login_petugas/login_distributor.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/login_petugas/login_kelompok.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/login_petugas/login_params.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/login_petugas/login_ppl.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/register_petugas/register_petugas.dart';
import 'package:mol_petani/domain/usecase/auth_petugas/register_petugas/register_petugas_param.dart';
import 'package:mol_petani/presentation/provider/usecases/auth_petugas_usecase/get_login_petugas_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/auth_petugas_usecase/login_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/auth_petugas_usecase/login_kelompok_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/auth_petugas_usecase/login_ppl_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/auth_petugas_usecase/logout_petugas_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/auth_petugas_usecase/register_petugas_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_petugas_provider.g.dart';

@Riverpod(keepAlive: true)
class UserDataPetugas extends _$UserDataPetugas {
  @override
  Future<User?> build() async {
    GetLoginPetugas getLoginUserPetugas = ref.read(getLoginPetugasProvider);
    var result = await getLoginUserPetugas(null);

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
        return user;
      case Failed(message: _):
        return null;
    }
  }

  Future<void> loginPpl({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    LoginPpl login = ref.read(loginPplProvider);

    var result = await login(LoginParams(email: email, password: password));
    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> loginDistributor({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    LoginDistributor login = ref.read(loginDistributorProvider);

    var result = await login(LoginParams(email: email, password: password));
    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(message: final mesage):
        state = AsyncError(FlutterError(mesage), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> loginKelompok({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    LoginKelompok login = ref.read(loginKelompokProvider);

    var result = await login(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logoutPetugas() async {
    var logoutPpl = ref.read(logoutProvider);
    var result = await logoutPpl(null);

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }

  Future<void> registerPetugas(
      {required String nama,
      required String email,
      required String password,
      required String keterangan,
      List<String>? cangkupan,
      required String collection,
      String? fotoUrl,
      String? kelompok}) async {
    state = const AsyncLoading();

    RegisterPetugas registerPetugas = ref.read(registerPetugasProvider);

    var result = await registerPetugas(RegisterPetugasParam(
      nama: nama,
      email: email,
      password: password,
      keterangan: keterangan,
      collection: collection,
      cangkupan: cangkupan,
      fotoUrl: fotoUrl,
      kelompok: kelompok,
    ));
    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }
}
