import 'package:mol_petani/data/firebase/firebase_maps_repository.dart';
import 'package:mol_petani/data/repository/maps_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "maps_repository_provider.g.dart";

@riverpod
MapsRepository mapsRepository(MapsRepositoryRef ref) =>
    FirebaseMapsRepository();
