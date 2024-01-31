class RegisterOfficerParam {
  final String nama;
  final String email;
  final String password;
  final String? fotoUrl;
  final String keterangan;
  final String? desa;
  final List<String>? cangkupan;
  final String? kelompok;
  final String? idPPl;
  final String? kecamatan;

  RegisterOfficerParam({
    required this.nama,
    required this.email,
    required this.password,
    required this.keterangan,
    required this.desa,
    this.fotoUrl,
    this.cangkupan,
    this.kelompok,
    this.idPPl,
    this.kecamatan,
  });
}
