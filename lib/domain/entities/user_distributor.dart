import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_distributor.freezed.dart';
part 'user_distributor.g.dart';

@freezed
class UserDistrubutor with _$UserDistrubutor {
  factory UserDistrubutor({
    required String uid,
    required String name,
    required String email,
    required String information,
    required String familyIdentificationNumber,
    required String idPPL,
    String? fotoUrl,
    required String address,
    required String toko,
    @Default([]) List? scope,
    required int mobileNumber,
  }) = _UserDistrubutor;

  factory UserDistrubutor.fromJson(Map<String, dynamic> json) =>
      _$UserDistrubutorFromJson(json);
}
