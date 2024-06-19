import 'package:mol_petani/domain/usecase/create_point_location/create_point_location.dart';
import 'package:mol_petani/presentation/provider/repository/maps_repository/maps_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_location_provider.g.dart";

@riverpod
CreatePointLocation createPointLocation(CreatePointLocationRef ref) =>
    CreatePointLocation(
        mapsRepository: ref.watch(mapsRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
