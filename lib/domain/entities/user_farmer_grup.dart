import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_farmer_grup.freezed.dart';
part 'user_farmer_grup.g.dart';

@freezed
class UserFarmerGroup with _$UserFarmerGroup {
  factory UserFarmerGroup({
    required String uid,
    required String name,
    required String leaderName,
    required String email,
    required String information,
    required String familyIdentificationNumber,
    String? fotoUrl,
    required String farmerGrup,
    required String village,
    required String idPPL,
    required int mobileNumber,
  }) = _UserFarmerGroup;

  factory UserFarmerGroup.fromJson(Map<String, dynamic> json) =>
      _$UserFarmerGroupFromJson(json);
}
