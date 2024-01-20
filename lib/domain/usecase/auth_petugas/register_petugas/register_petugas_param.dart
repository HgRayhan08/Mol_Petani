class RegisterPetugasParam {
  final String nama;
  final String email;
  final String password;
  final String? fotoUrl;
  final String keterangan;
  final List<String>? cangkupan;
  final String? kelompok;
  final String collection;

  RegisterPetugasParam(
      {required this.nama,
      required this.email,
      required this.password,
      required this.keterangan,
      this.fotoUrl,
      this.cangkupan,
      this.kelompok,
      required this.collection});
}
