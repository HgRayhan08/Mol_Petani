import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';

class FirebaseSubmissionFertilizerRepository
    implements SubmissionFretilizerRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseSubmissionFertilizerRepository({FirebaseFirestore? firebaseFirestore})
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
      "submission": 0
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
                submission: e["submission"],
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

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> getKuotaAccepted(
      {required String idGrupFarmer, required String information}) async {
    CollectionReference<Map<String, dynamic>> document =
        _firebaseFirestore.collection("Fertilizer_Kuota_Data");

    try {
      var dataAccepted = await document
          .where("idUserGrup", isEqualTo: idGrupFarmer)
          .where("information", isEqualTo: information)
          .get();
      if (dataAccepted.docs.isNotEmpty) {
        return Result.success(dataAccepted.docs
            .map(
              (e) => SubmissionKuotaFertilizer(
                idDocument: e.id,
                idUserGrup: e["idUserGrup"],
                idPPL: e["idPPL"],
                idSubmission: e["idSubmission"],
                leaderName: e["leaderName"],
                pplName: e["pplName"],
                distributorName: e["distributorName"],
                senderName: e["senderName"],
                recipientName: e["recipientName"],
                sendNameDistributor: e["sendNameDistributor"],
                recipientNameSender: e["recipientNameSender"],
                grupFarmer: e["grupFarmer"],
                village: e["village"],
                submission: e["submission"],
                information: e["information"],
                informationSend: e["informationSend"],
                dateOfFilling: e["dateOfFilling"],
                prosesDate: e["prosesDate"],
                reciptDate: e["reciptDate"],
                forYear: e["forYear"],
                dateSend: e["dateSend"],
                ureaSubmission: e["ureaSubmission"],
                poskaSubmission: e["poskaSubmission"],
                ureaReceived: e["ureaReceived"],
                poskaReceived: e["poskaReceived"],
                poskasend: e["poskasend"],
                ureaSend: e["ureaSend"],
              ),
            )
            .toList());
      } else {
        return const Result.failed("Failed get data");
      }
    } catch (e) {
      return const Result.failed("Firebase failed get Data");
    }
  }

  @override
  Future<Result<String>> updateAcceptedFertilizer({
    required String idDocument,
    required int ureaUpdate,
    required int poskaUpdate,
    required String dateUpdate,
    required String sendName,
    required String recipientName,
  }) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Fertilizer_Kuota_Data");

    await data.doc(idDocument).update({
      "ureaReceived": ureaUpdate,
      "poskaReceived": poskaUpdate,
      "reciptDate": dateUpdate,
      "senderName": sendName,
      "recipientName": recipientName,
      "information": "Selesai",
    });
    DocumentSnapshot<Map<String, dynamic>> result = await data.doc().get();
    if (result.exists) {
      return const Result.success("Success");
    } else {
      return const Result.failed("fail to update");
    }
  }

  // ppl
  @override
  Future<Result<SubmissionKuotaFertilizer>>
      createSubmissionKuotafertilizerGrup({
    required String idGrup,
    required String idSubmission,
    required String idPpl,
    required String leaderName,
    required String pplName,
    required String distributorName,
    required String grupFarmer,
    required String village,
    required int submission,
    required int urea,
    required int poska,
    required String dateOfFiling,
    required String forYear,
  }) async {
    CollectionReference<Map<String, dynamic>> kuota =
        _firebaseFirestore.collection("Fertilizer_Kuota_Data");
    await kuota.doc().set({
      "idUserGrup": idGrup,
      "idPPL": idPpl,
      "idSubmission": idSubmission,
      "leaderName": leaderName,
      "pplName": pplName,
      "distributorName": distributorName,
      "senderName": "",
      "recipientName": "",
      "sendNameDistributor": "",
      "recipientNameSender": "",
      "grupFarmer": grupFarmer,
      "village": village,
      "submission": submission,
      "information": "",
      "informationSend": "",
      "dateOfFilling": dateOfFiling,
      "prosesDate": "",
      "reciptDate": "",
      "forYear": forYear,
      "dateSend": "",
      "ureaSubmission": urea,
      "poskaSubmission": poska,
      "ureaReceived": 0,
      "poskaReceived": 0,
      "poskasend": 0,
      "ureaSend": 0,
    });
    DocumentSnapshot<Map<String, dynamic>> result = await kuota.doc().get();
    if (result.exists) {
      return Result.success(SubmissionKuotaFertilizer.fromJson(result.data()!));
    } else {
      return const Result.failed("Gagal Membuat pengajuan");
    }
  }

  @override
  Future<Result<List<DataSubmissionGroup>>> getSubmissionFarmerGroup(
      {required String idPPL, required String information}) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Submission_Fertilizer_Farmer_Grup");
    try {
      var result = await pengajuan
          .where("idPPL", isEqualTo: idPPL)
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
                submission: e["submission"],
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
  Future<Result<String>> updateSubmission(
      {required int submission, required String id}) async {
    CollectionReference<Map<String, dynamic>> kuota =
        _firebaseFirestore.collection("Submission_Fertilizer_Farmer_Grup");
    await kuota.doc(id).update({"submission": submission});
    DocumentSnapshot<Map<String, dynamic>> result = await kuota.doc().get();
    if (result.exists) {
      return const Result.success("Succes");
    } else {
      return const Result.failed("Gagal Membuat pengajuan");
    }
  }

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> getkuotaFertilizer({
    required String idPPL,
    required String information,
  }) async {
    CollectionReference<Map<String, dynamic>> getData =
        _firebaseFirestore.collection("Fertilizer_Kuota_Data");
    try {
      var data = await getData
          .where("idPPL", isEqualTo: idPPL)
          .where("information", isEqualTo: information)
          .get();
      if (data.docs.isNotEmpty) {
        return Result.success(data.docs
            .map(
              (e) => SubmissionKuotaFertilizer(
                idDocument: e.id,
                idUserGrup: e["idUserGrup"],
                idPPL: e["idPPL"],
                idSubmission: e["idSubmission"],
                leaderName: e["leaderName"],
                pplName: e["pplName"],
                distributorName: e["distributorName"],
                senderName: e["senderName"],
                recipientName: e["recipientName"],
                sendNameDistributor: e["sendNameDistributor"],
                recipientNameSender: e["recipientNameSender"],
                grupFarmer: e["grupFarmer"],
                village: e["village"],
                submission: e["submission"],
                information: e["information"],
                informationSend: e["informationSend"],
                dateOfFilling: e["dateOfFilling"],
                prosesDate: e["prosesDate"],
                reciptDate: e["reciptDate"],
                forYear: e["forYear"],
                dateSend: e["dateSend"],
                ureaSubmission: e["ureaSubmission"],
                poskaSubmission: e["poskaSubmission"],
                ureaReceived: e["ureaReceived"],
                poskaReceived: e["poskaReceived"],
                poskasend: e["poskasend"],
                ureaSend: e["ureaSend"],
              ),
            )
            .toList());
      } else {
        return const Result.failed("failed to get data");
      }
    } catch (e) {
      return const Result.failed("failed to get data");
    }
  }

  // distributor
  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> getdataKuota({
    required String name,
    required String keterangan,
    required String informationSend,
  }) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Fertilizer_Kuota_Data");
    try {
      var dataKuota = await data
          .where("distributorName", isEqualTo: name)
          .where("information", isEqualTo: keterangan)
          .where("informationSend", isEqualTo: informationSend)
          .get();
      if (dataKuota.docs.isNotEmpty) {
        return Result.success(dataKuota.docs
            .map(
              (e) => SubmissionKuotaFertilizer(
                idDocument: e.id,
                idUserGrup: e["idUserGrup"],
                idPPL: e["idPPL"],
                idSubmission: e["idSubmission"],
                leaderName: e["leaderName"],
                pplName: e["pplName"],
                distributorName: e["distributorName"],
                senderName: e["senderName"],
                recipientName: e["recipientName"],
                sendNameDistributor: e["sendNameDistributor"],
                recipientNameSender: e["recipientNameSender"],
                grupFarmer: e["grupFarmer"],
                village: e["village"],
                submission: e["submission"],
                information: e["information"],
                informationSend: e["informationSend"],
                dateOfFilling: e["dateOfFilling"],
                prosesDate: e["prosesDate"],
                reciptDate: e["reciptDate"],
                forYear: e["forYear"],
                dateSend: e["dateSend"],
                ureaSubmission: e["ureaSubmission"],
                poskaSubmission: e["poskaSubmission"],
                ureaReceived: e["ureaReceived"],
                poskaReceived: e["poskaReceived"],
                poskasend: e["poskasend"],
                ureaSend: e["ureaSend"],
              ),
            )
            .toList());
      } else {
        return const Result.failed("failed to get data");
      }
    } catch (e) {
      return const Result.failed("Firebase failed get data");
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
  Future<Result<String>> updateSendFertilizer({
    required String idDocument,
    required int ureaSend,
    required int poskaSend,
    required String datesend,
    required String sendName,
    required String recipientName,
  }) async {
    CollectionReference<Map<String, dynamic>> update =
        _firebaseFirestore.collection("Fertilizer_Kuota_Data");

    await update.doc(idDocument).update({
      "ureaSend": ureaSend,
      "poskasend": poskaSend,
      "dateSend": datesend,
      "sendNameDistributor": sendName,
      "recipientNameSender": recipientName,
      "informationSend": "Selesai",
    });
    DocumentSnapshot<Map<String, dynamic>> result = await update.doc().get();
    if (result.exists) {
      return const Result.success("Success");
    } else {
      return const Result.failed("fail to update");
    }
  }
}
