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
  Future<Result<DataPengajuanPupuk>> createSubmissionFertilizer(
      {required String idkelompoktani,
      required String namaKetua,
      required String desa,
      required String forYear,
      required String tanggal,
      List<PetaniPupuk>? petaniPupuk}) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Pengajuan_pupuk_petani");
    await pengajuan.doc().set({
      "idKelompoktani": idkelompoktani,
      "namaKetua": namaKetua,
      "desa": desa,
      "forYear": forYear,
      "tanggal": tanggal,
      "petaniPupuk": petaniPupuk,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await pengajuan.doc().get();
    if (result.exists) {
      return Result.success(DataPengajuanPupuk.fromJson(result.data()!));
    } else {
      return const Result.failed("Gagal Membuat pengajuan");
    }
  }

  @override
  Future<Result<List<DataPengajuanPupuk>>> getSubmissionFertilizerGrup(
      {required String idKelompoktani}) async {
    CollectionReference<Map<String, dynamic>> pengajuan =
        _firebaseFirestore.collection("Pengajuan_pupuk_petani");

    try {
      var result = await pengajuan
          .where("idKelompoktani", isEqualTo: idKelompoktani)
          .get();
      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map(
              (e) => DataPengajuanPupuk(
                idDocument: result.docs.single.id,
                idKelompoktani: e["idKelompoktani"],
                namaKetua: e["namaKetua"],
                desa: e["desa"],
                forYear: e["forYear"],
                tanggal: e["tanggal"],
                petaniPupuk: e["petaniPupuk"],
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
  Future<Result<DataPengajuanPupuk>> getDetailSubmissionFertilizer(
      {required String id}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("Pengajuan_pupuk_petani/$id");
    DocumentSnapshot<Map<String, dynamic>> resultData =
        await documentReference.get();
    if (resultData.exists) {
      return Result.success(DataPengajuanPupuk.fromJson(resultData.data()!));
    } else {
      return const Result.failed("Data Pupuk tidak tersedia");
    }
  }
}
