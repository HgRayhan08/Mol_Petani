import 'package:mol_petani/domain/usecase/get_all_location_farmer/get_all_location_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/maps_repository/maps_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_location_farmer_provider.g.dart';

// @riverpod
// GetDataLocation getDataLocation(GetDataLocationRef ref) => GetDataLocation(
//     mapsRepository: ref.watch(mapsRepositoryProvider),
//     sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));

@riverpod
GetAllLocationFarmer getAllLocationFarmer(GetAllLocationFarmerRef ref) =>
    GetAllLocationFarmer(
        mapsRepository: ref.watch(mapsRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
