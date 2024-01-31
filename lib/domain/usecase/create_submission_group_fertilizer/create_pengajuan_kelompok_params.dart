import 'package:mol_petani/domain/entities/petani_pupuk.dart';

class CreateSubmissionFertilizerParams {
  final String idKelompoktani;
  final String namaKetua;
  final String desa;
  final String forYear;
  final String tanggal;
  final List<PetaniPupuk>? petaniPupuk;

  CreateSubmissionFertilizerParams({
    required this.idKelompoktani,
    required this.namaKetua,
    required this.desa,
    required this.forYear,
    required this.tanggal,
    this.petaniPupuk,
  });
}
