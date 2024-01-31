abstract interface class SharedPrefRepository {
  Future<void> saveDataLogin(String user);
  Future<void> removeDataLogin();
  Future<String> getDataLogin();
}
