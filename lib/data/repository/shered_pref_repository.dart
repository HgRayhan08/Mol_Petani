abstract interface class SharedPrefRepository {
  Future<void> saveDataLogin(List<String> user);
  Future<void> removeDataLogin();
  Future<List<String>?> getDataLogin();
}
