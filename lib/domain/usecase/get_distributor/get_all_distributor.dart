import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetAllDistributor
    implements UseCase<Result<List<UserDistrubutor>>, void> {
  final UserRepository userRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetAllDistributor({
    required this.userRepository,
    required this.sharedPrefRepository,
  });

  @override
  Future<Result<List<UserDistrubutor>>> call(void _) async {
    List<String>? idPPl = await sharedPrefRepository.getDataLogin();
    var data = await userRepository.getAllDistributor(idppl: idPPl![1]);
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
