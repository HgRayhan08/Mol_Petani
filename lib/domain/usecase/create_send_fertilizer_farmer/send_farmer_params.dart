class SendFarmerParams {
  final String idUserFarmer;
  final String idPPL;
  final String farmerName;
  final String year;
  final String distribution;
  final int ureaDistribution;
  final int poskaDistribution;

  SendFarmerParams(
      {required this.idUserFarmer,
      required this.idPPL,
      required this.farmerName,
      required this.year,
      required this.distribution,
      required this.ureaDistribution,
      required this.poskaDistribution});
}
