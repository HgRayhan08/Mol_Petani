import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_petani.freezed.dart';
part 'user_petani.g.dart';

@freezed
class UserPetani with _$UserPetani {
  factory UserPetani({
    required String nama,
    required String kelompokTani,
  }) = _UserPetani;

  factory UserPetani.fromJson(Map<String, dynamic> json) =>
      _$UserPetaniFromJson(json);
}
