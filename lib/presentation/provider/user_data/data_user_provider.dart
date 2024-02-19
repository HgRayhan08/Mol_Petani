import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/domain/usecase/create_submission_fertilizer_farmer/create_submission_fertilizer_farmer.dart';
import 'package:mol_petani/domain/usecase/create_submission_fertilizer_farmer/create_fertilizer_farmer_params.dart';
import 'package:mol_petani/domain/usecase/create_submission_fertilizer_grup/create_fertilizer_grup_params.dart';
import 'package:mol_petani/domain/usecase/create_submission_fertilizer_grup/create_submission_fertilizer_grup.dart';
import 'package:mol_petani/domain/usecase/get_distributor/get_all_distributor.dart';
import 'package:mol_petani/domain/usecase/get_grup_farmer/get_all_grup_farmer.dart';
import 'package:mol_petani/domain/usecase/get_submission_fertilizer_farmer/get_submission_farmer_params.dart';
import 'package:mol_petani/domain/usecase/get_submission_fertilizer_farmer/get_submition_farmer.dart';
import 'package:mol_petani/domain/usecase/get_submission_fertilizer_grup/get_submission_grup_fertilizer_params.dart';
import 'package:mol_petani/domain/usecase/get_login_distributor/get_login_distributor.dart';
import 'package:mol_petani/domain/usecase/get_login_grup/get_login_grup.dart';
import 'package:mol_petani/domain/usecase/get_login_ppl/get_login_ppl.dart';
import 'package:mol_petani/domain/usecase/get_submission_fertilizer_grup/get_submission_grup_fertilizer.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_distributor.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_grup.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_params.dart';
import 'package:mol_petani/domain/usecase/login_officer/login_ppl.dart';
import 'package:mol_petani/domain/usecase/register_officer/register_petugas_param.dart';
import 'package:mol_petani/domain/usecase/register_officer/registrasi_distributor.dart';
import 'package:mol_petani/domain/usecase/register_officer/registrasi_grup_farmer.dart';
import 'package:mol_petani/domain/usecase/upload_image/upload_image.dart';
import 'package:mol_petani/domain/usecase/upload_image/upload_image_params.dart';
import 'package:mol_petani/presentation/provider/usecases/create_fertilizer_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/create_fertilizer_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_all_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_all_grup_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_login_ppl_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_submission_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/login_ppl_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/logout_petugas_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/register_distributor_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/register_grup_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/upload_image_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_user_provider.g.dart';

@Riverpod(keepAlive: true)
class DataUser extends _$DataUser {
  @override
  Future<User?> build() async {
    GetLoginPpl getppl = ref.read(getLoginPplProvider);
    var resultppl = await getppl(null);

    GetLoginDistributor getDistributor = ref.read(getLoginDistributorProvider);
    var resultDis = await getDistributor(null);

    GetLoginGrup getKelompok = ref.read(getLoginGrupProvider);
    var resultKelompok = await getKelompok(null);

    if (resultppl.isSuccess) {
      switch (resultppl) {
        case Success(value: final user):
          state = AsyncData(user);
          return user;
        case Failed(message: _):
          return null;
      }
    } else if (resultDis.isSuccess) {
      switch (resultDis) {
        case Success(value: final user):
          state = AsyncData(user);
          return user;
        case Failed(message: _):
          return null;
      }
    } else if (resultKelompok.isSuccess) {
      switch (resultKelompok) {
        case Success(value: final user):
          state = AsyncData(user);
          return user;
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
    await logoutPpl(null);
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
        fotoUrl: fotoUrl,
        kelompok: kelompok,
        desa: desa,
      ),
    );
    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<String> registerDistributor({
    required String nama,
    required String email,
    required String password,
    String? subDistrik,
    List<String>? cangkupan,
  }) async {
    state = const AsyncLoading();

    RegisterDistributor registerDistributor =
        ref.read(registerDistributorProvider);

    var result = await registerDistributor(
      RegisterOfficerParam(
          nama: nama,
          email: email,
          password: password,
          fotoUrl: "",
          cangkupan: cangkupan,
          kecamatan: subDistrik),
    );
    switch (result) {
      case Success():
        return "succses create account distributor";
      case Failed():
        return "faled create account ";
    }
  }

  Future<List<User>> getallGrupFarmer() async {
    GetAllGrupFarmer grupFarmer = ref.read(getAllGrupFarmerProvider);
    var result = await grupFarmer(0);
    if (result case Success(value: final data)) {
      return data;
    }
    return [];
  }

  Future<List<User>> getallDistributor() async {
    GetAllDistributor distributor = ref.read(getAllDistributorProvider);
    var result = await distributor(0);
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

  Future<DataSubmissionFertilizer> createPengajuanPupuk({
    required String namaKetua,
    required String desa,
    required String forYear,
    required String tanggal,
    required String grupFarmer,
  }) async {
    CreateSubmissionFertilizerGrup pengajuan =
        ref.read(createSubmissionFertilizerGrupProvider);
    var result = await pengajuan(
      CreateFertilizerGrupParams(
          leaderName: namaKetua,
          village: desa,
          forYear: forYear,
          date: tanggal,
          grupFarmer: grupFarmer),
    );
    if (result case Success(value: final data)) {
      return data;
    } else {
      return DataSubmissionFertilizer(
          idGrupFarmers: "",
          leaderName: "",
          village: "",
          forYear: "",
          date: "",
          grupFarmer: '',
          keterangan: "",
          pengajuan: "");
    }
  }

  Future<List<DataSubmissionFertilizer>> getPengajuan(
      {required String keterangan, String? uid}) async {
    GetSubmissionGrupFertilizer pengajuan =
        ref.read(getSubmissionFertilizerGrupProvider);
    var result = await pengajuan(
        GetSubmissionGrupFertilizerParams(keterangan: keterangan, uid: uid));
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }

  Future<String> uploadImage({required File imageFile}) async {
    UploadImage uploadImaged = ref.read(uploadImageProvider);
    var result = await uploadImaged(UploadImageParams(imageFilel: imageFile));
    String image = result.resultValue!;
    return image;
  }

  Future<String> createSubmissionFarmer({
    required String idSubmmision,
    required String namaPetani,
    required String nik,
    required double luasLahan,
    required String fotoKtp,
    required String fotoKK,
    required String fotoPajak,
  }) async {
    CreateSubmissionFarmer create = ref.read(createSubmissionFarmerProvider);
    var result = await create(CreateFertilizerFarmerParams(
        idSubmission: idSubmmision,
        namaPetani: namaPetani,
        nik: nik,
        luasLahan: luasLahan,
        fotoKtp: fotoKtp,
        fotoKK: fotoKK,
        fotoPajak: fotoPajak));

    if (result case Success(value: _)) {
      return "Sucsess Create Submission Farmer";
    } else {
      return "failed Create Submission Farmer";
    }
  }

  Future<List<PetaniPupuk>> getDataSubmisiionFarmer(
      {required String idKelompok}) async {
    GetSubmissionFarmer pengajuan = ref.read(getSubmissionFarmerProvider);
    var result =
        await pengajuan(GetSubmitionFarmerParams(idSubmition: idKelompok));
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }
}
