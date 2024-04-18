import 'package:mol_petani/domain/usecase/get_fertilizer_farmer/get_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_fertilizer_farmer_provider.g.dart";

@riverpod
GetFertilizerFarmer getFertilizerFarmer(GetFertilizerFarmerRef ref) =>
    GetFertilizerFarmer(
      submissionFretilizerRepository:
          ref.watch(submissionFretilizerRepositoryProvider),
    );
