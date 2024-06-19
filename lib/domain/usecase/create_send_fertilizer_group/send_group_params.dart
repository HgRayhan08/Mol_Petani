class SendGroupParams {
  final String idGroupFarmer;
  final String nameDistributor;
  final String year;
  final int send;
  final int sendUrea;
  final int sendPoska;

  SendGroupParams(
      {required this.idGroupFarmer,
      required this.nameDistributor,
      required this.year,
      required this.send,
      required this.sendUrea,
      required this.sendPoska});
}
