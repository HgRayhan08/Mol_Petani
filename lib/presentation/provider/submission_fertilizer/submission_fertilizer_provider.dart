import 'dart:io';

import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_farmer/create_fertilizer_farmer.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_farmer/create_fertilizer_farmer_params.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_farmer_grup/create_fertilizer_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_farmer_grup/create_fertilizer_grup_params.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_kuota/create_submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_kuota/submission_kuota_params.dart';
import 'package:mol_petani/domain/usecase/get_data_kuota_accepted/get_kuota_accepted.dart';
import 'package:mol_petani/domain/usecase/get_data_kuota_fertilizer/get_data_kuota.dart';
import 'package:mol_petani/domain/usecase/get_data_kuota_fertilizer/kuota_on_distributor_params.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer/get_fertilizer_farmer.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer/get_submission_farmer_params.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer_grup/get_fertilizer_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer_grup/get_fertilizer_farmer_grup_params.dart';
import 'package:mol_petani/domain/usecase/get_kuota_fertilizer_submission/get_kuota_fertilizzer_submission.dart';
import 'package:mol_petani/domain/usecase/get_submission_farmer_group/get_fertilizer_farmer_grup_params.dart';
import 'package:mol_petani/domain/usecase/get_submission_farmer_group/get_submission_farmer_group.dart';
import 'package:mol_petani/domain/usecase/upate_accepted_group/update_accepted_group.dart';
import 'package:mol_petani/domain/usecase/upate_accepted_group/update_accepted_group_params.dart';
import 'package:mol_petani/domain/usecase/update_information_submission_distributor/update_submission_distributor.dart';
import 'package:mol_petani/domain/usecase/update_information_submission_distributor/update_submission_distributor_params.dart';
import 'package:mol_petani/domain/usecase/update_send_fertilizer/update_send_fertilizer.dart';
import 'package:mol_petani/domain/usecase/update_send_fertilizer/update_send_fertilizer_params.dart';
import 'package:mol_petani/presentation/provider/usecases/create_fertilizer_farmer_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/create_fertilizer_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/create_fertilizer_kuota_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_data_kuota_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_fertilizer_farmer_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_fertilizer_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_kuota_accepted_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_kuota_fertilizer_submission_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_submission_farmer_group_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/update_accepted_group_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/update_send_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/update_submission_distributor_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "submission_fertilizer_provider.g.dart";

@Riverpod(keepAlive: true)
class FertilizerSubmission extends _$FertilizerSubmission {
  @override
  FutureOr<String> build() {
    return "";
  }

  Future<List<DataSubmissionGroup>> getSubmissionFertilizerFarmerGrup(
      {required String keterangan}) async {
    GetFertilizerFarmerGrup pengajuan =
        ref.read(getFertilizerFarmerGrupProvider);
    var result =
        await pengajuan(GetFertilizerFarmerGrupParams(keterangan: keterangan));
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }

  Future<DataSubmissionGroup> createSubmissionFertilizerFarmerGrup({
    required String namaKetua,
    required String desa,
    required String forYear,
    required String tanggal,
    required String grupFarmer,
  }) async {
    CreateFertilizerFarmerGrup pengajuan =
        ref.read(createFertilizerFarmerGrupProvider);
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
      return DataSubmissionGroup(
        idGrupFarmers: "",
        idPPL: "",
        leaderName: "",
        village: "",
        forYear: "",
        date: "",
        grupFarmer: '',
        information: "",
        submission: 0,
      );
    }
  }

  Future<String> createSubmissionFarmer({
    required String idSubmmision,
    required String namaPetani,
    required String nik,
    required double luasLahan,
    required File fotoKtp,
    required File fotoKK,
    required File fotoPajak,
  }) async {
    CreateFertilizerFarmer create = ref.read(createFertilizerFarmerProvider);
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

  Future<List<SupportingDataFertilizer>> getDataSubmisiionFarmer(
      {required String idKelompok}) async {
    GetFertilizerFarmer pengajuan = ref.read(getFertilizerFarmerProvider);
    var result =
        await pengajuan(GetSubmitionFarmerParams(idSubmition: idKelompok));
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }

  Future<List<DataSubmissionGroup>> getSubmissionFarmerGroup(
      {required String keterangan}) async {
    GetSubmissionFarmerGroup pengajuan =
        ref.read(getSubmissionFarmerGroupProvider);
    var result =
        await pengajuan(GetSubmissionFarmerGroupParams(keterangan: keterangan));
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }

  Future<Result<SubmissionKuotaFertilizer>> createSubmissionKuotaFertilizer({
    required String idGrup,
    required String idSubmission,
    required String leaderName,
    required String distributorName,
    required String grupFarmer,
    required String village,
    required int submission,
    required int urea,
    required int poska,
    required String forYear,
  }) async {
    CreateFertilizerKuota create = ref.read(createFertilizerKuotaProvider);
    var result = await create(
      SubmissionKuotaParams(
        idGrup: idGrup,
        idSubmission: idSubmission,
        leaderName: leaderName,
        distributorName: distributorName,
        grupFarmer: grupFarmer,
        village: village,
        submission: submission,
        urea: urea,
        poska: poska,
        forYear: forYear,
      ),
    );
    if (result case Success(value: final data)) {
      return Result.success(data);
    } else {
      return const Result.failed("Create Submission kuota is falled");
    }
  }

  Future<List<SubmissionKuotaFertilizer>> getKuotaBaseonDistributor(
      {required String keterangan, required String informationSend}) async {
    GetDataKuota kuota = ref.read(getDataKuotaProvider);
    var result = await kuota(KuotaOnDistributorParams(
      keterangan: keterangan,
      informationSend: informationSend,
    ));
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }

  Future<String> updateSubmissionFertilizer(
      {required String idDocument}) async {
    UpdateSubmissionDistributor update =
        ref.read(updateSubmissionDistributorProvider);
    var result =
        await update(UpdateSubmissionDistributorParams(idDocument: idDocument));
    return result.toString();
  }

  Future<List<SubmissionKuotaFertilizer>> getDataKuotaAccepted() async {
    GetKuotaAccepted data = ref.read(getKuotaAcceptedProvider);
    var result = await data(0);
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }

  Future<String> updateAcceptedGroup({
    required String idDocument,
    required int poskaReceived,
    required int ureaReceived,
    required String sendName,
    required String recipientName,
  }) async {
    UpdateAcceptedGroup update = ref.read(updateAcceptedGroupProvider);
    var result = await update(UpdateAcceptedGroupparams(
      ureaUpdate: ureaReceived,
      poskaUpdate: poskaReceived,
      idDocument: idDocument,
      sendName: sendName,
      recipientName: recipientName,
    ));
    return result.toString();
  }

  Future<String> updateSendFertilizer({
    required String idDocument,
    required int ureaSend,
    required int poskaSend,
    required String sendName,
    required String recipientName,
  }) async {
    UpdateSendFertilizer update = ref.read(updateSendFertilizerProvider);
    var result = await update(UpdateSendFertilizerParams(
        idDocument: idDocument,
        ureaSend: ureaSend,
        poskaSend: poskaSend,
        sendName: sendName,
        recipientName: recipientName));
    return result.toString();
  }

  Future<List<SubmissionKuotaFertilizer>> getKuotaFertilizer() async {
    GetKuotaFertilizerSubmission data =
        ref.read(getKuotaFertilizerSubmissionProvider);

    var result = await data(0);
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }
}
