import 'package:mol_petani/data/repository/Authentication.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class Logout implements UseCase<void, void> {
  final Authentication _authentication;
  final SharedPrefRepository _sharedPrefRepository;

  Logout(
      {required Authentication authentication,
      required SharedPrefRepository sharedPrefRepository})
      : _authentication = authentication,
        _sharedPrefRepository = sharedPrefRepository;

  @override
  Future<void> call(void _) async {
    await _authentication.logout();
    return _sharedPrefRepository.removeDataLogin();

    // return _authentication.logout();
    // print()
    // if (_authentication == null) {
    // print(data);
    // } else {
    // throw "";
    // }
  }
}
