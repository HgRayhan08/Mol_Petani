import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ppl.freezed.dart';
part 'user_ppl.g.dart';

@freezed
class UserPpl with _$UserPpl {
  factory UserPpl({
    required String uid,
    required String name,
    required String email,
    required String information,
    String? familyIdentificationNumber,
    String? fotoUrl,
    String? subdistrict,
    @Default([]) List<String>? scope,
  }) = _UserPpl;

  factory UserPpl.fromJson(Map<String, dynamic> json) =>
      _$UserPplFromJson(json);
}
