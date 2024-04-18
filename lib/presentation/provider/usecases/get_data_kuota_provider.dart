import 'package:mol_petani/domain/usecase/get_data_kuota_fertilizer/get_data_kuota.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_data_kuota_provider.g.dart';

@riverpod
GetDataKuota getDataKuota(GetDataKuotaRef ref) => GetDataKuota(
    submission: ref.watch(submissionFretilizerRepositoryProvider),
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
