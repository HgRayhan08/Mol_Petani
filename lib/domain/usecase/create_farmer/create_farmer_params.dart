class CreateFarmerparams {
  final String name;
  final String village;
  final String nik;
  final String kartuKeluarga;
  final String luasLahan;
  final String jenisKelamin;
  final String noHp;
  final String dateOfBirth;

  CreateFarmerparams(
      {required this.name,
      required this.village,
      required this.nik,
      required this.kartuKeluarga,
      required this.luasLahan,
      required this.jenisKelamin,
      required this.noHp,
      required this.dateOfBirth});
}
