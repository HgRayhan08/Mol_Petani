import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';

class FirebaseSubmissionFertilizerRepository
    implements SubmissionFretilizerRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseSubmissionFertilizerRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<DataSubmissionFertilizer>> createSubmissionFertilizer({
    required String idGrupFarmers,
    required String leaderName,
    required String village,
    required String forYear,
    required String date,
    required String grupFarmer,
    required String keterangan,
  }) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Pengajuan_pupuk_petani");
    await pengajuan.doc().set({
      "idGrupFarmers": idGrupFarmers,
      "leaderName": leaderName,
      "grupFarmer": grupFarmer,
      "village": village,
      "forYear": forYear,
      "date": date,
      "keterangan": keterangan,
      "Pengajuan": 0
    });

    DocumentSnapshot<Map<String, dynamic>> result = await pengajuan.doc().get();

    if (result.exists) {
      return Result.success(DataSubmissionFertilizer.fromJson(result.data()!));
    } else {
      return const Result.failed("Gagal Membuat pengajuan");
    }
  }

  @override
  Future<Result<List<DataSubmissionFertilizer>>> getSubmissionFertilizerGrup(
      {required String idKelompoktani, required String keterangan}) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Pengajuan_pupuk_petani");
    try {
      var result = await pengajuan
          .where("idGrupFarmers", isEqualTo: idKelompoktani)
          .where("keterangan", isEqualTo: keterangan)
          .get();

      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map(
              (e) => DataSubmissionFertilizer(
                idDocument: e.id,
                idGrupFarmers: e["idGrupFarmers"],
                leaderName: e["leaderName"],
                village: e["village"],
                forYear: e["forYear"],
                date: e["date"],
                grupFarmer: e["grupFarmer"],
                keterangan: e["keterangan"],
                pengajuan: e["Pengajuan"],
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
  Future<Result<DataSubmissionFertilizer>> getDetailSubmissionFertilizer(
      {required String id}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("Pengajuan_pupuk_petani/$id");
    DocumentSnapshot<Map<String, dynamic>> resultData =
        await documentReference.get();
    if (resultData.exists) {
      return Result.success(
          DataSubmissionFertilizer.fromJson(resultData.data()!));
    } else {
      return const Result.failed("Data Pupuk tidak tersedia");
    }
  }

  @override
  Future<Result<PetaniPupuk>> createFertilizerFarmer({
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
        _firebaseFirestore.collection("Data_Pengajuan_pupuk_petani");
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
      return Result.success(PetaniPupuk.fromJson(result.data()!));
    } else {
      return const Result.failed("Gagal Membuat pengajuan");
    }
  }

  @override
  Future<Result<List<PetaniPupuk>>> getDataSubmissionFarmer(
    String idDocumennt,
  ) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Data_Pengajuan_pupuk_petani");
    try {
      var result =
          await pengajuan.where("idSubmission", isEqualTo: idDocumennt).get();

      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map(
              (e) => PetaniPupuk(
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
}
