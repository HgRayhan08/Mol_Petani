import 'package:mol_petani/data/repository/maps_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/area_location.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetAllLocationFarmer
    implements UseCase<Result<List<AreaLocation>>, void> {
  final MapsRepository mapsRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetAllLocationFarmer(
      {required this.mapsRepository, required this.sharedPrefRepository});
  @override
  Future<Result<List<AreaLocation>>> call(void params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await mapsRepository.getAllLocation(idPPL: user![1]);
    print(result.resultValue!.length);
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message),
    };
  }
}
