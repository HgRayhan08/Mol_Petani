import 'dart:io';

class RegisterFarmerGrupParams {
  final String name;
  final String leaderName;
  final String email;
  final String password;
  final String familyIdentificationNumber;
  final File fotoUrl;
  final String farmerGrup;
  final String village;
  final int mobileNumber;
  RegisterFarmerGrupParams({
    required this.name,
    required this.leaderName,
    required this.email,
    required this.password,
    required this.familyIdentificationNumber,
    required this.farmerGrup,
    required this.village,
    required this.fotoUrl,
    required this.mobileNumber,
  });
}
