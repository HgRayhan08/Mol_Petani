// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

class PplParams {
  final String nama;
  final String email;
  final String password;
  final File? fotoUrl;
  List<String>? cangkupan;
  String? kecamatan;
  Uint8List? webfotourl;
  final String nik;
  PplParams(
      {required this.nama,
      required this.email,
      required this.password,
      required this.fotoUrl,
      this.cangkupan,
      this.kecamatan,
      required this.nik,
      this.webfotourl});
}
