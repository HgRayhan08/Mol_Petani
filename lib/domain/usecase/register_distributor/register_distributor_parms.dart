import 'dart:io';

class RegisterDistributorParams {
  final String name;
  final String email;
  final String password;
  final String familyIdentificationNumber;
  final File fotoUrl;
  final String address;
  final List<String> scope;
  final int mobileNumber;

  RegisterDistributorParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.familyIdentificationNumber,
      required this.address,
      required this.fotoUrl,
      required this.scope,
      required this.mobileNumber});
}
