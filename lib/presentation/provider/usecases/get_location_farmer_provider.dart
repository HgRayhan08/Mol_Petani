import 'package:mol_petani/domain/usecase/get_location_farmer/get_location_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/maps_repository/maps_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_location_farmer_provider.g.dart';

@riverpod
GetLocationFarmer getLocationFarmer(GetLocationFarmerRef ref) =>
    GetLocationFarmer(mapsRepository: ref.watch(mapsRepositoryProvider));
