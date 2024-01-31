import 'package:freezed_annotation/freezed_annotation.dart';

part 'petani_pupuk.freezed.dart';
part 'petani_pupuk.g.dart';

@freezed
class PetaniPupuk with _$PetaniPupuk {
  factory PetaniPupuk({
    required String namaPetani,
    required String nik,
    required double luasLahan,
    required String fotoKtp,
    required String fotoKK,
    required String fotoPajak,
  }) = _PetaniPupuk;

  factory PetaniPupuk.fromJson(Map<String, dynamic> json) =>
      _$PetaniPupukFromJson(json);
}
