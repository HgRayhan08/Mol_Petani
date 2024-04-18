import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/get_data_kuota_fertilizer/get_data_kuota.dart';
import 'package:mol_petani/domain/usecase/get_data_kuota_fertilizer/kuota_on_distributor_params.dart';
import 'package:mol_petani/domain/usecase/get_distributor/get_all_distributor.dart';
import 'package:mol_petani/domain/usecase/get_grup_farmer/get_all_grup_farmer.dart';
import 'package:mol_petani/domain/usecase/get_login_farmer_grup/get_login_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/get_login_distributor/get_login_distributor.dart';
import 'package:mol_petani/domain/usecase/get_login_ppl/get_login_ppl.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_distributor.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_grup.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_params.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_ppl.dart';
import 'package:mol_petani/domain/usecase/register_distributor/register_distributor_parms.dart';
import 'package:mol_petani/domain/usecase/register_distributor/registrasi_distributor.dart';
import 'package:mol_petani/domain/usecase/register_farmer_grup/register_farmer_grup_params.dart';
import 'package:mol_petani/domain/usecase/register_farmer_grup/registrasi_farmer_grup.dart';
import 'package:mol_petani/presentation/provider/usecases/get_all_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_all_grup_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_data_kuota_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_farmer_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_ppl_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_farmer_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_ppl_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/logout_petugas_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/register_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/register_grup_farmer_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_user_provider.g.dart';

@Riverpod(keepAlive: true)
class DataUser extends _$DataUser {
  @override
  Future<Map<String, dynamic>?> build() async {
    GetLoginPpl getppl = ref.read(getLoginPplProvider);
    var resultppl = await getppl(null);

    GetLoginDistributor getDistributor = ref.read(getLoginDistributorProvider);
    var resultDis = await getDistributor(null);

    GetLoginFarmerGrup getKelompok = ref.read(getLoginFarmerGrupProvider);
    var resultKelompok = await getKelompok(null);

    if (resultppl.isSuccess) {
      switch (resultppl) {
        case Success(value: final user):
          return user.toJson();
        case Failed(message: _):
          return null;
      }
    } else if (resultDis.isSuccess) {
      switch (resultDis) {
        case Success(value: final user):
          return user.toJson();
        case Failed(message: _):
          return null;
      }
    } else if (resultKelompok.isSuccess) {
      switch (resultKelompok) {
        case Success(value: final user):
          return user.toJson();
        case Failed(message: _):
          return null;
      }
    }
    return null;
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
        state = AsyncData({
          "uid": user.uid,
          "name": user.name,
          "email": user.email,
          "information": user.information,
          "fotoUrl": user.fotoUrl,
          "scope": user.scope,
          "subdistrict": user.subdistrict,
        });
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
        state = AsyncData({
          "idPpl": user.idPPL,
          "uid": user.uid,
          "name": user.name,
          "email": user.email,
          "information": user.information,
          "fotoUrl": user.fotoUrl,
          "scope": user.scope,
        });
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

    LoginFarmerGrup login = ref.read(loginFarmerGrupProvider);

    var result = await login(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        state = AsyncData({
          "idPpl": user.idPPL,
          "uid": user.uid,
          "name": user.name,
          "email": user.email,
          "information": user.information,
          "fotoUrl": user.fotoUrl,
        });
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logoutPetugas() async {
    var logoutPpl = ref.read(logoutProvider);
    await logoutPpl(null);
    state = const AsyncData(null);
  }

  Future<void> registerGrupFarmer({
    required String nama,
    required String email,
    required String password,
    required String village,
    required String familyIdentificationNumber,
    required File fotoUrl,
    required String kelompok,
    required int mobileNumber,
  }) async {
    state = const AsyncLoading();

    RegisterFarmerGrup registrasiKelompok =
        ref.read(registerFarmerGrupProvider);

    var result = await registrasiKelompok(
      RegisterFarmerGrupParams(
          name: nama,
          email: email,
          password: password,
          fotoUrl: fotoUrl,
          farmerGrup: kelompok,
          village: village,
          mobileNumber: mobileNumber,
          familyIdentificationNumber: familyIdentificationNumber),
    );
    switch (result) {
      case Success(value: final user):
        state = AsyncData({
          "uid": user.uid,
          "name": user.name,
          "email": user.email,
          "information": user.information,
          "fotoUrl": user.fotoUrl,
          "scope": user.scope,
          "subdistrict": user.subdistrict,
        });
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<String> registerDistributor({
    required String nama,
    required String email,
    required String password,
    required String address,
    required String familyIdentificationNumber,
    List<String>? scope,
    required File image,
    required int mobileNumber,
  }) async {
    state = const AsyncLoading();

    RegisterDistributor registerDistributor =
        ref.read(registerDistributorProvider);

    var result = await registerDistributor(
      RegisterDistributorParams(
        name: nama,
        email: email,
        password: password,
        fotoUrl: image,
        scope: scope!,
        familyIdentificationNumber: familyIdentificationNumber,
        address: address,
        mobileNumber: mobileNumber,
      ),
    );
    switch (result) {
      case Success():
        return "succses create account distributor";
      case Failed():
        return "faled create account ";
    }
  }

  Future<List<UserFarmerGroup>> getallGrupFarmer() async {
    GetAllGrupFarmer grupFarmer = ref.read(getAllGrupFarmerProvider);
    var result = await grupFarmer(0);
    if (result case Success(value: final data)) {
      return data;
    }
    return [];
  }

  Future<List<UserDistrubutor>> getallDistributor() async {
    GetAllDistributor distributor = ref.read(getAllDistributorProvider);
    var result = await distributor(null);
    if (result case Success(value: final data)) {
      return data;
    }
    return [];
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

  // Future<String> uploadImage({required File imageFile}) async {
  //   UploadImage uploadImaged = ref.read(uploadImageProvider);
  //   var result = await uploadImaged(UploadImageParams(imageFilel: imageFile));
  //   String image = result.resultValue!;
  //   return image;
  // }


}
