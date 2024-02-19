import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_pengajuan_pupuk.freezed.dart';
part 'data_pengajuan_pupuk.g.dart';

@freezed
class DataSubmissionFertilizer with _$DataSubmissionFertilizer {
  factory DataSubmissionFertilizer({
    required String idGrupFarmers,
    required String leaderName,
    required String village,
    required String forYear,
    required String date,
    required String grupFarmer,
    required String keterangan,
    required String pengajuan,
    String? idDocument,
  }) = _DataSubmissionFertilizer;

  factory DataSubmissionFertilizer.fromJson(Map<String, dynamic> json) =>
      _$DataSubmissionFertilizerFromJson(json);
}
