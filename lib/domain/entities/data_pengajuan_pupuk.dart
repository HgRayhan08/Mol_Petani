import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';

part 'data_pengajuan_pupuk.freezed.dart';
part 'data_pengajuan_pupuk.g.dart';

@freezed
class DataPengajuanPupuk with _$DataPengajuanPupuk {
  factory DataPengajuanPupuk({
    required String idKelompoktani,
    required String namaKetua,
    required String desa,
    required String forYear,
    required String tanggal,
    @Default([]) List<PetaniPupuk>? petaniPupuk,
    String? idDocument,
  }) = _DataPengajuanPupuk;

  factory DataPengajuanPupuk.fromJson(Map<String, dynamic> json) =>
      _$DataPengajuanPupukFromJson(json);
}
