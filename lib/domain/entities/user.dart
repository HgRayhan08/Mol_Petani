import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String uid,
    required String nama,
    required String email,
    required String keterangan,
    String? fotoUrl,
    @Default([]) List<String>? cangkupan,
    String? kelompok,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
