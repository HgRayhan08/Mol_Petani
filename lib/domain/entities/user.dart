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
    @Default([]) List? cangkupan,
    String? kecamatan,
    String? kelompok,
    String? desa,
    String? idPPL,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
