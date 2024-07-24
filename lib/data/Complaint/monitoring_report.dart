import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/result.dart';

class MonitoringReport implements ReportRepository {
  final FirebaseFirestore _firebaseFirestore;

  MonitoringReport({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<Report>> createReport({
    required String idGrupFarmer,
    required String idPPL,
    required String idFarmer,
    required String groupFarmer,
    required String nameFarmer,
    required String information,
    required String reporting,
    required String reportingDetail,
    required String submissionDate,
  }) async {
    CollectionReference<Map<String, dynamic>> create =
        await _firebaseFirestore.collection("Complaint_Report");
    await create.doc().set({
      "idGrupFarmer": idGrupFarmer,
      "idPPL": idPPL,
      "idUserFarmer": idFarmer,
      "farmerGroup": groupFarmer,
      "nameFarmer": nameFarmer,
      "information": information,
      "reporting": reporting,
      "detailReporting": reportingDetail,
      "submissionDate": submissionDate,
      "completionDate": "",
    });
    DocumentSnapshot<Map<String, dynamic>> result = await create.doc().get();
    if (result.exists) {
      return Result.success(Report.fromJson(result.data()!));
    } else {
      return const Result.failed("failed Create report");
    }
  }

  @override
  Future<Result<List<Report>>> getreport({required String idFarmer}) async {
    CollectionReference<Map<String, dynamic>> getData =
        await _firebaseFirestore.collection("Complaint_Report");
    try {
      var result =
          await getData.where("idUserFarmer", isEqualTo: idFarmer).get();
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs
              .map((e) => Report(
                  idDocument: e.id,
                  idGrupFarmer: e["idGrupFarmer"],
                  idPPL: e["idPPL"],
                  idUserFarmer: e["idUserFarmer"],
                  farmerGroup: e["farmerGroup"],
                  nameFarmer: e["nameFarmer"],
                  information: e["information"],
                  reporting: e["reporting"],
                  detailReporting: e["detailReporting"],
                  submissionDate: e["submissionDate"],
                  completionDate: e["completionDate"]))
              .toList(),
        );
      } else {
        return const Result.failed("");
      }
    } catch (e) {
      return Result.failed("error $e");
    }
  }

  @override
  Future<Result<List<Report>>> getReportFarmer(
      {required String idPPL, required String information}) async {
    CollectionReference<Map<String, dynamic>> getData =
        await _firebaseFirestore.collection("Complaint_Report");

    try {
      var result = await getData
          .where("idPPL", isEqualTo: idPPL)
          .where("information", isEqualTo: information)
          .get();
      print(result.docs.length);
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs
              .map((e) => Report(
                  idDocument: e.id,
                  idGrupFarmer: e["idGrupFarmer"],
                  idPPL: e["idPPL"],
                  idUserFarmer: e["idUserFarmer"],
                  farmerGroup: e["farmerGroup"],
                  nameFarmer: e["nameFarmer"],
                  information: e["information"],
                  reporting: e["reporting"],
                  detailReporting: e["detailReporting"],
                  submissionDate: e["submissionDate"],
                  completionDate: e["completionDate"]))
              .toList(),
        );
      } else {
        return const Result.failed("");
      }
    } catch (e) {
      return Result.failed("error $e");
    }
  }

  @override
  Future<Result<String>> updateStatusComplaint(
      {required String idDocument}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Complaint_Report");
    await data.doc(idDocument).update({"information": "Terima"});
    DocumentSnapshot<Map<String, dynamic>> result = await data.doc().get();
    if (result.exists) {
      return const Result.success("Succses update information");
    } else {
      return const Result.failed("Failed update data");
    }
  }

  @override
  Future<Result<String>> deleteComplaint({required String idDocument}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Complaint_Report");
    await data.doc(idDocument).delete();
    DocumentSnapshot<Map<String, dynamic>> result = await data.doc().get();
    if (result.exists) {
      return const Result.success('Document successfully deleted');
    } else {
      return const Result.failed('Failed to delete document');
    }
  }

  // REPORT HAMA
  @override
  Future<Result<PestReport>> createReportHama({
    required String idPPL,
    required String idFarmerGroup,
    required String idUserFarmer,
    required String nameFarmerGroup,
    required String name,
    required String submissionDate,
    required String reporting,
    required String detailReporting,
  }) async {
    CollectionReference<Map<String, dynamic>> create =
        _firebaseFirestore.collection("Hama_Report");
    await create.doc().set({
      "idPPL": idPPL,
      "idFarmerGroup": idFarmerGroup,
      "nameFarmerGroup": nameFarmerGroup,
      "idUserFarmer": idUserFarmer,
      "name": name,
      "information": "Pengajuan",
      "submissionDate": submissionDate,
      "complateDate": "",
      "reporting": reporting,
      "detailReporting": detailReporting,
    });
    DocumentSnapshot<Map<String, dynamic>> result = await create.doc().get();
    if (result.exists) {
      return Result.success(PestReport.fromJson(result.data()!));
    } else {
      return const Result.failed("failed Create report");
    }
  }

  @override
  Future<Result<List<PestReport>>> getReportHama(
      {required String idPPL, required String information}) async {
    CollectionReference<Map<String, dynamic>> getData =
        _firebaseFirestore.collection("Hama_Report");
    var result = await getData
        .where("idPPL", isEqualTo: idPPL)
        .where("information", isEqualTo: information)
        .get();
    try {
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs
              .map((e) => PestReport(
                  idDocument: e.id,
                  idPPL: e["idPPL"],
                  idFarmerGroup: e["idFarmerGroup"],
                  idUserFarmer: e["idUserFarmer"],
                  nameFarmerGroup: e["nameFarmerGroup"],
                  name: e["name"],
                  information: e["information"],
                  submissionDate: e["submissionDate"],
                  complateDate: e["complateDate"],
                  reporting: e["reporting"],
                  detailReporting: e["detailReporting"]))
              .toList(),
        );
      } else {
        return const Result.failed("failed get data laporan hama");
      }
    } catch (e) {
      return Result.failed("error $e");
    }
  }

  @override
  Future<Result<List<PestReport>>> getSubmissionReportHama(
      {required String idFarmerGroup, required String information}) async {
    CollectionReference<Map<String, dynamic>> getData =
        _firebaseFirestore.collection("Hama_Report");
    var result = await getData
        .where("idFarmerGroup", isEqualTo: idFarmerGroup)
        .where("information", isEqualTo: information)
        .get();
    try {
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs
              .map((e) => PestReport(
                  idDocument: e.id,
                  idPPL: e["idPPL"],
                  idFarmerGroup: e["idFarmerGroup"],
                  idUserFarmer: e["idUserFarmer"],
                  nameFarmerGroup: e["nameFarmerGroup"],
                  name: e["name"],
                  information: e["information"],
                  submissionDate: e["submissionDate"],
                  complateDate: e["complateDate"],
                  reporting: e["reporting"],
                  detailReporting: e["detailReporting"]))
              .toList(),
        );
      } else {
        return const Result.failed("failed get data laporan hama");
      }
    } catch (e) {
      return Result.failed("error $e");
    }
  }

  @override
  Future<Result<String>> updateStatusPestReport(
      {required String idDocument}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Hama_Report");
    await data.doc(idDocument).update({"information": "Terima"});
    DocumentSnapshot<Map<String, dynamic>> result = await data.doc().get();
    if (result.exists) {
      return const Result.success("Succses update information");
    } else {
      return const Result.failed("Failed update data");
    }
  }

  @override
  Future<Result<String>> deletePest({required String idDocument}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Hama_Report");
    await data.doc(idDocument).delete();
    DocumentSnapshot<Map<String, dynamic>> result = await data.doc().get();
    if (result.exists) {
      return const Result.success('Document successfully deleted');
    } else {
      return const Result.failed('Failed to delete document');
    }
  }
}
