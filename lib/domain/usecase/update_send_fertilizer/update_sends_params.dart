class UpdateSendsParams {
  final int send;
  final int sendUrea;
  final int sendPoska;
  final String idDocument;

  UpdateSendsParams(
      {required this.send,
      required this.sendUrea,
      required this.sendPoska,
      required this.idDocument});
}
