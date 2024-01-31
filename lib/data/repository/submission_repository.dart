import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';

abstract interface class SubmissionFretilizerRepository {
  Future<Result<DataPengajuanPupuk>> createSubmissionFertilizer({
    required String idkelompoktani,
    required String namaKetua,
    required String desa,
    required String forYear,
    required String tanggal,
    List<PetaniPupuk>? petaniPupuk,
  });
  Future<Result<List<DataPengajuanPupuk>>> getSubmissionFertilizerGrup(
      {required String idKelompoktani});
  Future<Result<DataPengajuanPupuk>> getDetailSubmissionFertilizer(
      {required String id});
}
