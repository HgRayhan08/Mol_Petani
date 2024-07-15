import 'package:mol_petani/domain/usecase/delete_point_location/delete_point_location.dart';
import 'package:mol_petani/presentation/provider/repository/maps_repository/maps_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_point_location_provider.g.dart';

@riverpod
DeletePointLocation deletePointLocation(DeletePointLocationRef ref) =>
    DeletePointLocation(mapsRepository: ref.watch(mapsRepositoryProvider));
