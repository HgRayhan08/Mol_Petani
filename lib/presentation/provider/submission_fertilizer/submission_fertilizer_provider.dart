import 'dart:io';

import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/create_acception_fertilizer_group/acception_fertilizer_group_params.dart';
import 'package:mol_petani/domain/usecase/create_acception_fertilizer_group/create_acception_fertilizer_group.dart';
import 'package:mol_petani/domain/usecase/create_additional_fertilizer_group/create_additional_fertilizer_group.dart';
import 'package:mol_petani/domain/usecase/create_additional_fertilizer_group/create_fertilizer_farmer_params.dart';
import 'package:mol_petani/domain/usecase/create_send_fertilizer_farmer/create_send_fertilizer_farmer.dart';
import 'package:mol_petani/domain/usecase/create_send_fertilizer_farmer/send_farmer_params.dart';
import 'package:mol_petani/domain/usecase/create_send_fertilizer_group/create_send_fertilizer_group.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_farmer_grup/create_fertilizer_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_farmer_grup/create_fertilizer_grup_params.dart';
import 'package:mol_petani/domain/usecase/create_send_fertilizer_group/send_group_params.dart';
import 'package:mol_petani/domain/usecase/delete_distribution_farmer/delete_distribution_farmer.dart';
import 'package:mol_petani/domain/usecase/delete_send_fertilizer/delete_send_fertilizer.dart';
import 'package:mol_petani/domain/usecase/get_accept_fertilizer_farmer/get_acceptd_fertilizer_farmer.dart';
import 'package:mol_petani/domain/usecase/get_data_monitoring/get_data_monitoring.dart';
import 'package:mol_petani/domain/usecase/get_distribution_group_farmer/get_distribution_group_farmer.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer/get_fertilizer_farmer.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer/get_submission_farmer_params.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer_grup/get_fertilizer_farmer_grup.dart';
import 'package:mol_petani/domain/usecase/get_fertilizer_farmer_grup/get_fertilizer_farmer_grup_params.dart';
import 'package:mol_petani/domain/usecase/get_distribution_fertilizer_group/get_distribution_fertilizer_group.dart';
import 'package:mol_petani/domain/usecase/get_grup_farmer/get_all_grup_farmer.dart';
import 'package:mol_petani/domain/usecase/get_grup_farmer/group_farmer_params.dart';
import 'package:mol_petani/domain/usecase/get_history_distribution_farmer_group/get_history_distribution_farmer_group.dart';
import 'package:mol_petani/domain/usecase/get_history_distribution_fertilizer_group/get_history_distribution_fertilizer_group.dart';
import 'package:mol_petani/domain/usecase/get_send_fertilizer_farmer/get_send_fertilizer_farmer.dart';
import 'package:mol_petani/domain/usecase/get_submission_farmer_group/get_fertilizer_farmer_grup_params.dart';
import 'package:mol_petani/domain/usecase/get_submission_farmer_group/get_submission_farmer_group.dart';
import 'package:mol_petani/domain/usecase/upate_reception_fertilizer/reception_fertilizer_params.dart';
import 'package:mol_petani/domain/usecase/upate_reception_fertilizer/update_reception_fertilizer.dart';
import 'package:mol_petani/domain/usecase/update_send_fertilizer/update_send_fertilizer.dart';
import 'package:mol_petani/domain/usecase/update_send_fertilizer/update_sends_params.dart';
import 'package:mol_petani/presentation/provider/usecases/create_acception_fertilizer_group_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/create_send_fertilizer_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/create_send_fertilizer_group_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/create_fertilizer_farmer_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/create_additional_fertilizer_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/delete_distribution_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/delete_send_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_accept_fertilizer_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_all_grup_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_data_monitoring_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_distribution_fertilizer_group_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_distribution_group_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_fertilizer_farmer_grup_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_fertilizer_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_history_distribution_farmer_group_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_history_distribution_fertilizer_group_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_send_fertilizer_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_submission_farmer_group_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/update_reception_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/update_send_fertilizer_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "submission_fertilizer_provider.g.dart";

@Riverpod(keepAlive: true)
class FertilizerSubmission extends _$FertilizerSubmission {
  @override
  FutureOr<String> build() {
    return "";
  }

  // group Farmer
  Future<String> createSubmissionFarmer({
    required String idSubmmision,
    required String namaPetani,
    required String nik,
    required double luasLahan,
    required File fotoKtp,
    required File fotoKK,
    required File fotoPajak,
  }) async {
    CreateAdditionalFertilizerGroup create =
        ref.read(createAdditionalFertilizerGroupProvider);
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
      );
    }
  }

  Future<List<SubmissionKuotaFertilizer>> getDristirbutionGroupFarmer() async {
    GetDistributionGroupFarmer data =
        ref.read(getDistributionGroupFarmerProvider);
    var result = await data(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<List<SubmissionKuotaFertilizer>>
      getHistoryDristirbutionFarmerGroup() async {
    GetHistoryDistributionFarmerGroup data =
        ref.read(getHistoryDistributionFarmerGroupProvider);
    var result = await data(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<String> createSendFertilizerFarmer({
    required String idGroupFarmer,
    required String idUserFarmer,
    required String idPPL,
    required String farmerName,
    required String year,
    required String distribution,
    required int ureaDistribution,
    required int poskaDistribution,
  }) async {
    CreateSendFertilizerFarmer create =
        ref.read(createSendFertilizerFarmerProvider);
    var result = await create(
      SendFarmerParams(
          idUserFarmer: idUserFarmer,
          idPPL: idPPL,
          farmerName: farmerName,
          year: year,
          distribution: distribution,
          ureaDistribution: ureaDistribution,
          poskaDistribution: poskaDistribution),
    );
    if (result.isSuccess) {
      return "Succes create send farmer";
    } else {
      return "failed create send farmer";
    }
  }

  Future<List<DistributionFertilizerFarmer>> getSendFertilizerFarmer(
      {required String idFarmer}) async {
    GetSendFertilizerFarmer getData = ref.read(getSendFertilizerFarmerProvider);
    var result = await getData(idFarmer);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<String> updateAcceptionFertilizerGroup(
      {required String idDocument,
      required int acceptUrea,
      required int acceptPoska,
      required String nameAcceptGroupFarmer,
      required String nameSendDistributor}) async {
    CreateAcceptionFertilizerGroup create =
        ref.read(createAcceptionFertilizerGroupProvider);
    var result = await create(AcceptionFertilizerGroupParams(
        idDocument: idDocument,
        acceptUrea: acceptUrea,
        acceptPoska: acceptPoska,
        nameAcceptGroupFarmer: nameAcceptGroupFarmer,
        nameSendDistributor: nameSendDistributor));
    if (result.isSuccess) {
      return "Update Acception fertilizer is Succses";
    } else {
      return "Failed update Acception";
    }
  }

  Future<String> deleteDistribusiFertilizer(
      {required String idDocument}) async {
    DeleteDistributionFarmer delete =
        ref.read(deleteDistributionFarmerProvider);
    var result = await delete(idDocument);
    switch (result) {
      case Success():
        return "success Delete";
      case Failed():
        return "failed Delete";
    }
  }

  // end group farmer

  // ppl

  Future<List<DataSubmissionGroup>> getSubmissionFarmerGroup(
      {required String idGroupFarmer}) async {
    GetSubmissionFarmerGroup pengajuan =
        ref.read(getSubmissionFarmerGroupProvider);
    var result = await pengajuan(
        GetSubmissionFarmerGroupParams(idGroupFarmer: idGroupFarmer));
    if (result case Success(value: final data)) {
      return data;
    }
    return const [];
  }

  Future<List<SubmissionKuotaFertilizer>> dataMonitoring(
      {required String idGroupFarmer}) async {
    GetDataMonitoring data = ref.read(getDataMonitoringProvider);
    var result = await data(idGroupFarmer);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }
  // end ppl

  // distributor

  Future<String> createSendFertilizerGroup({
    required String idGroupFarmer,
    required String nameDistributor,
    required String year,
    required int send,
    required int sendUrea,
    required int sendPoska,
  }) async {
    CreateSendFertilizerGroup create =
        ref.read(createSendFertilizerGroupProvider);

    var result = await create(SendGroupParams(
        idGroupFarmer: idGroupFarmer,
        nameDistributor: nameDistributor,
        year: year,
        send: send,
        sendUrea: sendUrea,
        sendPoska: sendPoska));
    if (result.isSuccess) {
      return "Create Succes";
    } else {
      return "Failed Create";
    }
  }

  Future<List<SubmissionKuotaFertilizer>>
      getdistributionFertilizerGroup() async {
    GetDistributionFertilizerGroup data =
        ref.read(getDistributionFertilizerGroupProvider);
    var result = await data(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<List<SubmissionKuotaFertilizer>>
      getHistorydistributionFertilizerGroup() async {
    GetHistoryDistributionFertilizerGroup data =
        ref.read(getHistoryDistributionFertilizerGroupProvider);
    var result = await data(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<List<UserFarmerGroup>> getallGrupFarmer() async {
    GetAllGrupFarmer grupFarmer = ref.read(getAllGrupFarmerProvider);
    var result = await grupFarmer(GroupFarmerParams(idPPL: 3));
    if (result case Success(value: final data)) {
      return data;
    }
    return [];
  }

  Future<bool> updateSendFertilizer({
    required int send,
    required int sendUrea,
    required int sendPoska,
    required String idDocument,
  }) async {
    UpdateSendFertilizer update = ref.read(updateSendFertilizerProvider);
    var result = await update(UpdateSendsParams(
        send: send,
        sendUrea: sendUrea,
        sendPoska: sendPoska,
        idDocument: idDocument));
    if (result.isSuccess) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> deleteSendFertilizer({required String idDocument}) async {
    DeleteSendFertilizer delete = ref.read(deleteSendFertilizerProvider);
    var result = await delete(idDocument);
    await ref
        .watch(fertilizerSubmissionProvider.notifier)
        .getdistributionFertilizerGroup();

    switch (result) {
      case Success():
        return "success Delete";
      case Failed():
        return "failed Delete";
    }
  }

  // end Distributor

  // farmer
  Future<String> updateReceptionFertilizerGroup({
    required String idDocument,
    required int acceptUrea,
    required int acceptPoska,
    required String plant,
  }) async {
    UpdateReceptionFertilizer update =
        ref.read(updateReceptionFertilizerProvider);
    var result = await update(ReceptionFertilizerParams(
      idDocument: idDocument,
      plant: plant,
      acceptUrea: acceptUrea,
      acceptPoska: acceptPoska,
    ));
    if (result.isSuccess) {
      return "Sucsses Update data reception fertilizer";
    } else {
      return "Failed update data";
    }
  }

  Future<List<DistributionFertilizerFarmer>> getAcceptFertilizerFarmer() async {
    GetAcceptFertilizerFarmer getData =
        ref.read(getAcceptFertilizerFarmerProvider);
    var result = await getData(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  // end Farmer

  // Future<String> updateSubmission(
  //     {required String idDocument, required int submission}) async {
  //   UpdateFertilizerSubmisson update =
  //       ref.read(updateFertilizerSubmissonProvider);
  //   var result = await update(
  //       UpdateSubmissionParams(idDocument: idDocument, submission: submission));
  //   if (result.isSuccess) {
  //     return "Succes Update";
  //   } else {
  //     return "Failed Update";
  //   }
  // }

  // Future<Result<SubmissionKuotaFertilizer>> createSubmissionKuotaFertilizer({
  //   required String idGrup,
  //   required String idSubmission,
  //   required String leaderName,
  //   required String distributorName,
  //   required String grupFarmer,
  //   required String village,
  //   required int submission,
  //   required int urea,
  //   required int poska,
  //   required String forYear,
  // }) async {
  //   CreateFertilizerKuota create = ref.read(createFertilizerKuotaProvider);
  //   var result = await create(
  //     SubmissionKuotaParams(
  //       idGrup: idGrup,
  //       idSubmission: idSubmission,
  //       leaderName: leaderName,
  //       distributorName: distributorName,
  //       grupFarmer: grupFarmer,
  //       village: village,
  //       submission: submission,
  //       urea: urea,
  //       poska: poska,
  //       forYear: forYear,
  //     ),
  //   );
  //   if (result case Success(value: final data)) {
  //     return Result.success(data);
  //   } else {
  //     return const Result.failed("Create Submission kuota is falled");
  //   }
  // }

  // Future<List<SubmissionKuotaFertilizer>> getKuotaBaseonDistributor(
  //     {required String keterangan, required String informationSend}) async {
  //   GetDataKuota kuota = ref.read(getDataKuotaProvider);
  //   var result = await kuota(KuotaOnDistributorParams(
  //     keterangan: keterangan,
  //     informationSend: informationSend,
  //   ));
  //   if (result case Success(value: final data)) {
  //     return data;
  //   }
  //   return const [];
  // }

  // Future<String> updateSubmissionFertilizer(
  //     {required String idDocument}) async {
  //   UpdateSubmissionDistributor update =
  //       ref.read(updateSubmissionDistributorProvider);
  //   var result =
  //       await update(UpdateSubmissionDistributorParams(idDocument: idDocument));
  //   return result.toString();
  // }

  // Future<List<SubmissionKuotaFertilizer>> getDataKuotaAccepted() async {
  //   GetKuotaAccepted data = ref.read(getKuotaAcceptedProvider);
  //   var result = await data(0);
  //   if (result case Success(value: final data)) {
  //     return data;
  //   }
  //   return const [];
  // }

  // Future<String> updateAcceptedGroup({
  //   required String idDocument,
  //   required int poskaReceived,
  //   required int ureaReceived,
  //   required String sendName,
  //   required String recipientName,
  // }) async {
  //   UpdateAcceptedGroup update = ref.read(updateAcceptedGroupProvider);
  //   var result = await update(UpdateAcceptedGroupparams(
  //     ureaUpdate: ureaReceived,
  //     poskaUpdate: poskaReceived,
  //     idDocument: idDocument,
  //     sendName: sendName,
  //     recipientName: recipientName,
  //   ));
  //   return result.toString();
  // }

  // Future<String> updateSendFertilizer({
  //   required String idDocument,
  //   required int ureaSend,
  //   required int poskaSend,
  //   required String sendName,
  //   required String recipientName,
  // }) async {
  //   UpdateSendFertilizer update = ref.read(updateSendFertilizerProvider);
  //   var result = await update(UpdateSendFertilizerParams(
  //       idDocument: idDocument,
  //       ureaSend: ureaSend,
  //       poskaSend: poskaSend,
  //       sendName: sendName,
  //       recipientName: recipientName));
  //   return result.toString();
  // }

  // Future<List<SubmissionKuotaFertilizer>> getKuotaFertilizer() async {
  //   GetKuotaFertilizerSubmission data =
  //       ref.read(getKuotaFertilizerSubmissionProvider);

  //   var result = await data(0);
  //   if (result case Success(value: final data)) {
  //     return data;
  //   }
  //   return const [];
  // }
}
