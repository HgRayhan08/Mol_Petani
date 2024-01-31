import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/create_submission_group_fertilizer/create_pengajuan_kelompok_params.dart';
import 'package:mol_petani/domain/usecase/create_submission_group_fertilizer/create_submission_fertilizer_grup.dart';
import 'package:mol_petani/domain/usecase/get_login_distributor/get_login_distributor.dart';
import 'package:mol_petani/domain/usecase/get_login_grup/get_login_grup.dart';
import 'package:mol_petani/domain/usecase/get_login_ppl/get_login_ppl.dart';
import 'package:mol_petani/domain/usecase/get_submission_grup/get_submission_grup_fertilizer.dart';
import 'package:mol_petani/domain/usecase/get_submission_grup/get_submission_param.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_distributor.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_grup.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_params.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_ppl.dart';
import 'package:mol_petani/domain/usecase/register_officer/register_petugas.dart';
import 'package:mol_petani/domain/usecase/register_officer/register_petugas_param.dart';
import 'package:mol_petani/domain/usecase/register_officer/registrasi_grup_farmer.dart';
import 'package:mol_petani/presentation/provider/usecases/create_submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_ppl_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_ppl_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/logout_petugas_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/register_grup_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/register_officer_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_user_provider.g.dart';

@Riverpod(keepAlive: true)
class DataUser extends _$DataUser {
  @override
  Future<User?> build() async {
    GetLoginPpl getppl = ref.read(getLoginPplProvider);
    var resultppl = await getppl(null);

    // GetLoginDistributor getDistributor = ref.read(getLoginDistributorProvider);
    // var resultDis = await getDistributor(null);

    // GetLoginGrup getKelompok = ref.read(getLoginGrupProvider);
    // var resultKelompok = await getKelompok(null);

    if (resultppl.isSuccess) {
      switch (resultppl) {
        case Success(value: final user):
          state = AsyncData(user);
          return user;
        case Failed(message: _):
          return null;
      }
    }
    //  else if (resultDis.isSuccess) {
    //   switch (resultDis) {
    //     case Success(value: final user):
    //       state = AsyncData(user);
    //       return user;
    //     case Failed(message: _):
    //       return null;
    //   }
    // } else if (resultKelompok.isSuccess) {
    //   switch (resultKelompok) {
    //     case Success(value: final user):
    //       state = AsyncData(user);
    //       return user;
    //     case Failed(message: _):
    //       return null;
    //   }
    // }
    // return null;
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

    LoginGrup login = ref.read(loginGrupProvider);

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
    state = const AsyncData(null);

    // switch (result) {
    //   case Success(value: _):
    //     state = const AsyncData(null);
    //   case Failed(:final message):
    //     state = AsyncError(FlutterError(message), StackTrace.current);
    //     state = AsyncData(state.valueOrNull);
    // }
  }

  Future<void> registerGrupFarmer({
    required String nama,
    required String email,
    required String password,
    required String desa,
    String? fotoUrl,
    String? kelompok,
  }) async {
    state = const AsyncLoading();

    RegisterGrupFarmer registrasiKelompok =
        ref.read(registerGrupFarmerProvider);

    var result = await registrasiKelompok(
      RegisterOfficerParam(
        nama: nama,
        email: email,
        password: password,
        keterangan: "Kelompok Tani",
        fotoUrl: fotoUrl,
        kelompok: kelompok,
        desa: desa,
      ),
    );
    switch (result) {
      case Success(value: final user):
        print(user);
        state = AsyncData(user);
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  // Future<void> registerPetugas(
  //     {required String nama,
  //     required String email,
  //     required String password,
  //     required String keterangan,
  //     required String desa,
  //     List<String>? cangkupan,
  //     required String collection,
  //     String? fotoUrl,
  //     String? idPPl,
  //     String? kelompok}) async {
  //   state = const AsyncLoading();

  //   RegisterOfficer registerPetugas = ref.read(registerOfficerProvider);

  //   var result = await registerPetugas(RegisterOfficerParam(
  //     nama: nama,
  //     email: email,
  //     password: password,
  //     keterangan: keterangan,
  //     collection: collection,
  //     cangkupan: cangkupan,
  //     fotoUrl: fotoUrl,
  //     kelompok: kelompok,
  //     desa: desa,
  //     idPPl: idPPl,
  //   ));
  //   switch (result) {
  //     case Success(value: final user):
  //       state = AsyncData(user);
  //     case Failed(:final message):
  //       state = AsyncError(FlutterError(message), StackTrace.current);
  //       state = const AsyncData(null);
  //   }
  // }

  Future<DataPengajuanPupuk> createPengajuanPupuk({
    required String idKelompoktani,
    required String namaKetua,
    required String desa,
    required String forYear,
    required String tanggal,
    List<PetaniPupuk>? petaniPupuk,
  }) async {
    CreateSubmissionFertilizerGrup pengajuan =
        ref.read(createSubmissionFertilizerGrupProvider);
    var result = await pengajuan(
      CreateSubmissionFertilizerParams(
        idKelompoktani: idKelompoktani,
        namaKetua: namaKetua,
        desa: desa,
        forYear: forYear,
        tanggal: tanggal,
        petaniPupuk: petaniPupuk,
      ),
    );
    if (result case Success(value: final data)) {
      return data;
    } else {
      return DataPengajuanPupuk(
        idKelompoktani: "",
        namaKetua: "",
        desa: "",
        forYear: "",
        tanggal: "",
      );
    }
  }

  Future<List<DataPengajuanPupuk>> getPengajuan(
      {required String idKelompok}) async {
    GetSubmissionGrupFertilizer pengajuan =
        ref.read(getSubmissionFertilizerGrupProvider);
    var result = await pengajuan(
      GetSubmissionParams(idKelompok: idKelompok),
    );
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }
}
