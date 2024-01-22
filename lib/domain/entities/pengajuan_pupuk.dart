import 'package:freezed_annotation/freezed_annotation.dart';

part 'pengajuan_pupuk.freezed.dart';
part 'pengajuan_pupuk.g.dart';

@freezed
class PengajuanPupuk with _$PengajuanPupuk {
  factory PengajuanPupuk({
    required String idPengajuan,
    required String desa,
  }) = _PengajuanPupuk;

  factory PengajuanPupuk.fromJson(Map<String, dynamic> json) =>
      _$PengajuanPupukFromJson(json);
}
