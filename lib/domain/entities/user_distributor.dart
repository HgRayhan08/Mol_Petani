import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_distributor.freezed.dart';
part 'user_distributor.g.dart';

@freezed
class UserDistrubutor with _$UserDistrubutor {
  factory UserDistrubutor({
    required String uid,
    required String idPPL,
    required String name,
    required String toko,
    required String email,
    String? fotoUrl,
    @Default([]) List? scope,
    required String information,
    required String nik,
    required String alamat,
    required int noHp,
  }) = _UserDistrubutor;

  factory UserDistrubutor.fromJson(Map<String, dynamic> json) =>
      _$UserDistrubutorFromJson(json);
}
