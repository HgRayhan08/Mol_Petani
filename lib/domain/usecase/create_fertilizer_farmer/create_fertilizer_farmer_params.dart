import 'dart:io';

class CreateFertilizerFarmerParams {
  final String idSubmission;
  final String namaPetani;
  final String nik;
  final double luasLahan;
  final File fotoKtp;
  final File fotoKK;
  final File fotoPajak;
  CreateFertilizerFarmerParams({
    required this.idSubmission,
    required this.namaPetani,
    required this.nik,
    required this.luasLahan,
    required this.fotoKtp,
    required this.fotoKK,
    required this.fotoPajak,
  });
}
