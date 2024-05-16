import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mol_petani/data/repository/report_repository.dart';
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
    required String idDataFarmer,
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
      "idFarmer": idFarmer,
      "idDataFarmer": idDataFarmer,
      "groupFarmer": groupFarmer,
      "nameFarmer": nameFarmer,
      "information": information,
      "reporting": reporting,
      "reportingDetail": reportingDetail,
      "submissionDate": submissionDate,
      "acceptedDate": "",
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
      var result = await getData.where("idFarmer", isEqualTo: idFarmer).get();
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs
              .map((e) => Report(
                  idGrupFarmer: e["idGrupFarmer"],
                  idPPL: e["idPPL"],
                  idFarmer: e["idFarmer"],
                  groupFarmer: e["groupFarmer"],
                  nameFarmer: e["nameFarmer"],
                  information: e["information"],
                  reporting: e["reporting"],
                  reportingDetail: e["reportingDetail"],
                  submissionDate: e["submissionDate"],
                  acceptedDate: e["acceptedDate"],
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
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs
              .map((e) => Report(
                  idGrupFarmer: e["idGrupFarmer"],
                  idPPL: e["idPPL"],
                  idFarmer: e["idFarmer"],
                  groupFarmer: e["groupFarmer"],
                  nameFarmer: e["nameFarmer"],
                  information: e["information"],
                  reporting: e["reporting"],
                  reportingDetail: e["reportingDetail"],
                  submissionDate: e["submissionDate"],
                  acceptedDate: e["acceptedDate"],
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
}
