import 'package:mol_petani/data/repository/get_data_user.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserLogin implements GetDataUser {
  @override
  Future<void> saveDataUser({required String uid}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("uid", uid);
  }

  @override
  Future<Result<String>> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    final _datauser = prefs.getString("uid");
    if (_datauser!.isNotEmpty) {
      return Result.success(_datauser);
    } else {
      return const Result.failed("data tidak ada");
    }
  }

  @override
  Future<void> removeDataUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("uid");
  }
}
