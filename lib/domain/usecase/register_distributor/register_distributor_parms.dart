import 'dart:io';
import 'dart:typed_data';

class RegisterDistributorParams {
  final String name;
  final String email;
  final String password;
  final String familyIdentificationNumber;
  final File fotoUrl;
  final String toko;
  final String address;
  final List<String> scope;
  final int mobileNumber;
  Uint8List? webfotourl;

  RegisterDistributorParams({
    required this.name,
    required this.email,
    required this.password,
    required this.familyIdentificationNumber,
    required this.address,
    required this.fotoUrl,
    required this.toko,
    required this.scope,
    required this.mobileNumber,
    this.webfotourl,
  });
}
