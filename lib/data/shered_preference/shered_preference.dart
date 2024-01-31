import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference implements SharedPrefRepository {
  @override
  Future<String> getDataLogin() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("dataLogin") ?? "";
  }

  @override
  Future<void> removeDataLogin() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove("dataLogin");
  }

  @override
  Future<void> saveDataLogin(String user) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("dataLogin", user);
  }
}
