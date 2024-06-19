import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';

class FirebaseFertilizerRepository implements FertilizerRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFertilizerRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  // Grup Farmer
  @override
  Future<Result<DataSubmissionGroup>> createSubmissionFertilizer({
    required String idGrupFarmers,
    required String idPPL,
    required String leaderName,
    required String village,
    required String forYear,
    required String date,
    required String grupFarmer,
  }) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Submission_Fertilizer_Farmer_Grup");
    await pengajuan.doc().set({
      "idGrupFarmers": idGrupFarmers,
      "idPPL": idPPL,
      "leaderName": leaderName,
      "grupFarmer": grupFarmer,
      "village": village,
      "forYear": forYear,
      "date": date,
      "information": "proses",
    });

    DocumentSnapshot<Map<String, dynamic>> result = await pengajuan.doc().get();

    if (result.exists) {
      return Result.success(DataSubmissionGroup.fromJson(result.data()!));
    } else {
      return const Result.failed("Gagal Membuat pengajuan");
    }
  }

  @override
  Future<Result<List<DataSubmissionGroup>>> getSubmissionFertilizerGroup(
      {required String idKelompoktani, required String information}) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Submission_Fertilizer_Farmer_Grup");
    try {
      var result = await pengajuan
          .where("idGrupFarmers", isEqualTo: idKelompoktani)
          .where("information", isEqualTo: information)
          .get();
      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map(
              (e) => DataSubmissionGroup(
                idDocument: e.id,
                idGrupFarmers: e["idGrupFarmers"],
                idPPL: e["idPPL"],
                leaderName: e["leaderName"],
                village: e["village"],
                forYear: e["forYear"],
                date: e["date"],
                grupFarmer: e["grupFarmer"],
                information: e["information"],
              ),
            )
            .toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed("message $e");
    }
  }

  @override
  Future<Result<DataSubmissionGroup>> getDetailSubmissionFertilizer(
      {required String id}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("Submission_Fertilizer_Farmer_Grup/$id");
    DocumentSnapshot<Map<String, dynamic>> resultData =
        await documentReference.get();
    if (resultData.exists) {
      return Result.success(
        DataSubmissionGroup.fromJson(resultData.data()!),
      );
    } else {
      return const Result.failed("Data Pupuk tidak tersedia");
    }
  }

  @override
  Future<Result<SupportingDataFertilizer>> additionalDataSubmission({
    required String idSubmission,
    required String idKelompokTani,
    required String namaPetani,
    required String nik,
    required double luasLahan,
    required String fotoKtp,
    required String fotoKK,
    required String fotoPajak,
  }) async {
    CollectionReference<Map<String, dynamic>> submission =
        _firebaseFirestore.collection("Addantional_Data_Fertilizer_Submission");
    await submission.doc().set({
      "idSubmission": idSubmission,
      "idKelompokTani": idKelompokTani,
      "namaPetani": namaPetani,
      "nik": nik,
      "luasLahan": luasLahan,
      "fotoKtp": fotoKtp,
      "fotoKK": fotoKK,
      "fotoPajak": fotoPajak,
    });
    DocumentSnapshot<Map<String, dynamic>> result =
        await submission.doc().get();
    if (result.exists) {
      return Result.success(SupportingDataFertilizer.fromJson(result.data()!));
    } else {
      return const Result.failed("Gagal Membuat pengajuan");
    }
  }

  @override
  Future<Result<List<SupportingDataFertilizer>>> getadditionalDataSubmission(
    String idDocumennt,
  ) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Addantional_Data_Fertilizer_Submission");
    try {
      var result =
          await pengajuan.where("idSubmission", isEqualTo: idDocumennt).get();

      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map(
              (e) => SupportingDataFertilizer(
                idKelompokTani: e["idKelompokTani"],
                namaPetani: e["namaPetani"],
                nik: e["nik"],
                luasLahan: e["luasLahan"],
                fotoKtp: e["fotoKtp"],
                fotoKK: e["fotoKK"],
                fotoPajak: e["fotoPajak"],
              ),
            )
            .toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed("message $e");
    }
  }

  // @override
  // Future<Result<String>> updateAcceptedFertilizer({
  //   required String idDocument,
  //   required int acceptUrea,
  //   required int acceptPoska,
  //   required String nameAcceptGroupFarmer,
  //   required String nameSendDistributor,
  //   required String acceptDate,
  // }) async {
  //   CollectionReference<Map<String, dynamic>> data =
  //       _firebaseFirestore.collection("Fertilizer_Distribution_Kuota");

  //   await data.doc(idDocument).update({
  //     "nameAcceptGroupFarmer": nameAcceptGroupFarmer,
  //     "nameSendDistributor": nameSendDistributor,
  //     "acceptDate": acceptDate,
  //     "information": "Selesai",
  //     "acceptUrea": acceptUrea,
  //     "acceptPoska": acceptPoska
  //   });
  //   DocumentSnapshot<Map<String, dynamic>> result = await data.doc().get();
  //   if (result.exists) {
  //     return const Result.success("Success");
  //   } else {
  //     return const Result.failed("fail to update");
  //   }
  // }

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> getDistributionGroupFarmer({
    required String idPPL,
    required String idGroupFarmer,
    required String information,
  }) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Fertilizer_Distribution_Kuota");
    var result = await data
        .where("idPPL", isEqualTo: idPPL)
        .where("idGroupFarmer", isEqualTo: idGroupFarmer)
        .where("information", isEqualTo: "Send")
        .get();
    if (result.docs.isNotEmpty) {
      return Result.success(result.docs
          .map(
            (e) => SubmissionKuotaFertilizer(
              idDocument: e.id,
              idPPL: e["idPPL"],
              idGroupFarmer: e["idGroupFarmer"],
              idDistributor: e["idDistributor"],
              information: e["information"],
              year: e["year"],
              send: e["send"],
              sendDate: e["sendDate"],
              acceptDate: e["acceptDate"],
              nameDistributor: e["nameDistributor"],
              leaderName: e["leaderName"],
              nameGroupFarmer: e["nameGroupFarmer"],
              nameAcceptGroupFarmer: e["nameAcceptGroupFarmer"],
              nameSendDistributor: e["nameSendDistributor"],
              sendUrea: e["sendUrea"],
              sendPoska: e["sendPoska"],
              acceptUrea: e["acceptUrea"],
              acceptPoska: e["acceptPoska"],
            ),
          )
          .toList());
    } else {
      return const Result.failed("failed get data");
    }
  }

  @override
  Future<Result<DistributionFertilizerFarmer>> createDistributionFarmer(
      {required String idGroupFarmer,
      required String idUserFarmer,
      required String idPPL,
      required String farmerName,
      required String year,
      required String distribution,
      required String distribusiDate,
      required int ureaDistribution,
      required int poskaDistribution}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Distribution_Fertilizer_Farmer");
    await data.doc().set({
      "idGroupFarmer": idGroupFarmer,
      "idUserFarmer": idUserFarmer,
      "idPPL": idPPL,
      "farmerName": farmerName,
      "year": year,
      "plant": "",
      "distribution": distribution,
      "information": "Distribution",
      "distribusiDate": distribusiDate,
      "pickupDate": "",
      "ureaDistribution": ureaDistribution,
      "poskaDistribution": poskaDistribution,
      "ureaPickup": 0,
      "poskaPickup": 0,
    });
    DocumentSnapshot<Map<String, dynamic>> result = await data.doc().get();
    if (result.exists) {
      return Result.success(
          DistributionFertilizerFarmer.fromJson(result.data()!));
    } else {
      return const Result.failed("Failed Create Data");
    }
  }

  @override
  Future<Result<List<DistributionFertilizerFarmer>>> getsendFertilizerFarmer(
      {required String idFarmer, required String idGroupFarmer}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Distribution_Fertilizer_Farmer");
    var result = await data
        .where("idUserFarmer", isEqualTo: idFarmer)
        .where("idGroupFarmer", isEqualTo: idGroupFarmer)
        .get();
    if (result.docs.isNotEmpty) {
      return Result.success(
        result.docs
            .map((e) => DistributionFertilizerFarmer(
                  idDocumennt: e.id,
                  idGroupFarmer: e["idGroupFarmer"],
                  idUserFarmer: e["idUserFarmer"],
                  idPPL: e["idPPL"],
                  farmerName: e["farmerName"],
                  year: e["year"],
                  plant: e["plant"],
                  distribution: e["distribution"],
                  information: e["information"],
                  distribusiDate: e["distribusiDate"],
                  pickupDate: e["pickupDate"],
                  ureaDistribution: e["ureaDistribution"],
                  poskaDistribution: e["poskaDistribution"],
                  ureaPickup: e["ureaPickup"],
                  poskaPickup: e["poskaPickup"],
                ))
            .toList(),
      );
    } else {
      return const Result.failed("failed Create data distribution");
    }
  }

  @override
  Future<Result<String>> updateDistributionFarmer(
      {required String idDocument,
      required int acceptUrea,
      required int acceptPoska,
      required String acceptDate,
      required String nameAcceptGroupFarmer,
      required String nameSendDistributor}) async {
    CollectionReference<Map<String, dynamic>> update =
        _firebaseFirestore.collection("Fertilizer_Distribution_Kuota");
    await update.doc(idDocument).update({
      "acceptUrea": acceptUrea,
      "acceptPoska": acceptPoska,
      "acceptDate": acceptDate,
      "nameAcceptGroupFarmer": nameAcceptGroupFarmer,
      "nameSendDistributor": nameSendDistributor,
      "information": "Selesai",
    });
    DocumentSnapshot<Map<String, dynamic>> result = await update.doc().get();
    if (result.exists) {
      return const Result.success("Success");
    } else {
      return const Result.failed("fail to update");
    }
  }
  // end group farmer

  // ppl
  @override
  Future<Result<List<DataSubmissionGroup>>> getSubmissionFarmerGroup(
      {required String idPPL, required String idGroupFarmer}) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Submission_Fertilizer_Farmer_Grup");

    try {
      var result = await pengajuan
          .where("idPPL", isEqualTo: "HuoLcOqRKVZvGt1emLM8TioU9nU2")
          .where("idGrupFarmers", isEqualTo: idGroupFarmer)
          .get();
      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map(
              (e) => DataSubmissionGroup(
                idDocument: e.id,
                idGrupFarmers: e["idGrupFarmers"],
                idPPL: e["idPPL"],
                leaderName: e["leaderName"],
                village: e["village"],
                forYear: e["forYear"],
                date: e["date"],
                grupFarmer: e["grupFarmer"],
                information: e["information"],
              ),
            )
            .toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed("message $e");
    }
  }

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> getDataMonitoring(
      {required String idPPL, required String idGroupFarmer}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Fertilizer_Distribution_Kuota");
    var result = await data
        .where("idPPL", isEqualTo: idPPL)
        .where("idGroupFarmer", isEqualTo: idGroupFarmer)
        .get();
    if (result.docs.isNotEmpty) {
      return Result.success(
        result.docs
            .map(
              (e) => SubmissionKuotaFertilizer(
                idPPL: e["idPPL"],
                idGroupFarmer: e["idGroupFarmer"],
                idDistributor: e["idDistributor"],
                information: e["information"],
                year: e["year"],
                send: e["send"],
                sendDate: e["sendDate"],
                acceptDate: e["acceptDate"],
                leaderName: e["leaderName"],
                nameDistributor: e["nameDistributor"],
                nameGroupFarmer: e["nameGroupFarmer"],
                nameAcceptGroupFarmer: e["nameAcceptGroupFarmer"],
                nameSendDistributor: e["nameSendDistributor"],
                sendUrea: e["sendUrea"],
                sendPoska: e["sendPoska"],
                acceptUrea: e["acceptUrea"],
                acceptPoska: e["acceptPoska"],
              ),
            )
            .toList(),
      );
    } else {
      return const Result.failed("Failed get data");
    }
  }

  // end ppl

  // distributor

  @override
  Future<Result<SubmissionKuotaFertilizer>> createSendFertilizerGroup({
    required String idPPL,
    required String idGroupFarmer,
    required String idDistributor,
    required String sendDate,
    required String leaderName,
    required String nameDistributor,
    required String nameGroupFarmer,
    required String year,
    required int send,
    required int sendUrea,
    required int sendPoska,
  }) async {
    CollectionReference<Map<String, dynamic>> create =
        _firebaseFirestore.collection('Fertilizer_Distribution_Kuota');
    await create.doc().set({
      "idPPL": idPPL,
      "idGroupFarmer": idGroupFarmer,
      "idDistributor": idDistributor,
      "information": "Send",
      "year": year,
      "send": send,
      "sendDate": sendDate,
      "acceptDate": "",
      "leaderName": leaderName,
      "nameDistributor": nameDistributor,
      "nameGroupFarmer": nameGroupFarmer,
      "nameAcceptGroupFarmer": "",
      "nameSendDistributor": "",
      "sendUrea": sendUrea,
      "sendPoska": sendPoska,
      "acceptUrea": 0,
      "acceptPoska": 0,
    });
    DocumentSnapshot<Map<String, dynamic>> result = await create.doc().get();
    if (result.exists) {
      return Result.success(SubmissionKuotaFertilizer.fromJson(result.data()!));
    } else {
      return const Result.failed("fail to update");
    }
  }

  @override
  Future<Result<String>> updateSubmissionkuota({
    required String idDocument,
    required String information,
    required String prosesDate,
  }) async {
    CollectionReference<Map<String, dynamic>> kuotaData =
        _firebaseFirestore.collection("Fertilizer_Kuota_Data");
    await kuotaData.doc(idDocument).update({
      "information": information,
      "informationSend": "Proses",
      "prosesDate": prosesDate,
    });
    DocumentSnapshot<Map<String, dynamic>> result = await kuotaData.doc().get();
    if (result.exists) {
      return const Result.success("Success");
    } else {
      return const Result.failed("fail to update");
    }
  }

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>>
      getDistributionFertilizerGroup({
    required String idPPL,
    required String idDistributor,
    required String information,
  }) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Fertilizer_Distribution_Kuota");

    var result = await data
        .where("idPPL", isEqualTo: idPPL)
        .where("idDistributor", isEqualTo: idDistributor)
        .where("information", isEqualTo: information)
        .get();
    if (result.docs.isNotEmpty) {
      return Result.success(result.docs
          .map(
            (e) => SubmissionKuotaFertilizer(
              idPPL: e["idPPL"],
              idGroupFarmer: e["idGroupFarmer"],
              idDistributor: e["idDistributor"],
              information: e["information"],
              year: e["year"],
              send: e["send"],
              sendDate: e["sendDate"],
              acceptDate: e["acceptDate"],
              leaderName: e["leaderName"],
              nameDistributor: e["nameDistributor"],
              nameGroupFarmer: e["nameGroupFarmer"],
              nameAcceptGroupFarmer: e["nameAcceptGroupFarmer"],
              nameSendDistributor: e["nameSendDistributor"],
              sendUrea: e["sendUrea"],
              sendPoska: e["sendPoska"],
              acceptUrea: e["acceptUrea"],
              acceptPoska: e["acceptPoska"],
            ),
          )
          .toList());
    } else {
      return const Result.failed("failed get data");
    }
  }

  // end Distributor

  // Farmer
  @override
  Future<Result<String>> updateSendFertilizer({
    required String idDocument,
    required String pickupDate,
    required String plant,
    required int ureaPickup,
    required int poskaPickup,
  }) async {
    CollectionReference<Map<String, dynamic>> update =
        _firebaseFirestore.collection("Distribution_Fertilizer_Farmer");

    await update.doc(idDocument).update({
      "pickupDate": pickupDate,
      "ureaPickup": ureaPickup,
      "poskaPickup": poskaPickup,
      "plant": plant,
      "information": "Selesai"
    });
    DocumentSnapshot<Map<String, dynamic>> result = await update.doc().get();
    if (result.exists) {
      return const Result.success("Success");
    } else {
      return const Result.failed("fail to update");
    }
  }

  @override
  Future<Result<List<DistributionFertilizerFarmer>>> getAcceptFertilizerFarmer(
      {required String idUserFarmer, required String idGroupFarmer}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Distribution_Fertilizer_Farmer");

    var result = await data
        .where("idGroupFarmer", isEqualTo: idGroupFarmer)
        .where("idUserFarmer", isEqualTo: idUserFarmer)
        .get();
    if (result.docs.isNotEmpty) {
      return Result.success(
        result.docs
            .map((e) => DistributionFertilizerFarmer(
                  idDocumennt: e.id,
                  idGroupFarmer: e["idGroupFarmer"],
                  idUserFarmer: e['idUserFarmer'],
                  idPPL: e["idPPL"],
                  farmerName: e["farmerName"],
                  year: e["year"],
                  plant: e["plant"],
                  distribution: e["distribution"],
                  information: e["information"],
                  distribusiDate: e["distribusiDate"],
                  pickupDate: e["pickupDate"],
                  ureaDistribution: e["ureaDistribution"],
                  poskaDistribution: e["poskaDistribution"],
                  ureaPickup: e["ureaPickup"],
                  poskaPickup: e["poskaPickup"],
                ))
            .toList(),
      );
    } else {
      return const Result.failed("failed Create data distribution");
    }
  }

  // end farmer
}
