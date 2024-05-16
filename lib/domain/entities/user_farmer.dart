import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_farmer.freezed.dart';
part 'user_farmer.g.dart';

@freezed
class UserFarmer with _$UserFarmer {
  factory UserFarmer({
    required String idGrupFarmer,
    required String idUserFarmer,
    required String idPPL,
    required String name,
    required String dateOfBirth,
    required String information,
    required String grupFarmer,
    required String village,
    required String email,
    required String noHp,
    required String nik,
    required String kartuKeluarga,
    required String luasLahan,
    required String jenisKelamin,
    String? idDocument,
  }) = _UserFarmer;

  factory UserFarmer.fromJson(Map<String, dynamic> json) =>
      _$UserFarmerFromJson(json);
}
