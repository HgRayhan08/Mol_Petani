import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';

abstract interface class SubmissionFretilizerRepository {
  Future<Result<DataSubmissionFertilizer>> createSubmissionFertilizer({
    required String idGrupFarmers,
    required String leaderName,
    required String village,
    required String forYear,
    required String date,
    required String grupFarmer,
    required String keterangan,
  });
  Future<Result<List<DataSubmissionFertilizer>>> getSubmissionFertilizerGrup(
      {required String idKelompoktani, required String keterangan});
  Future<Result<DataSubmissionFertilizer>> getDetailSubmissionFertilizer(
      {required String id});

  Future<Result<PetaniPupuk>> createFertilizerFarmer({
    required String idSubmission,
    required String idKelompokTani,
    required String namaPetani,
    required String nik,
    required double luasLahan,
    required String fotoKtp,
    required String fotoKK,
    required String fotoPajak,
  });
  Future<Result<List<PetaniPupuk>>> getDataSubmissionFarmer(String idDocumennt);
}
