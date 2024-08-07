import 'package:mol_petani/domain/usecase/get_data_kuota_accepted/get_kuota_accepted.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_kuota_accepted_provider.g.dart";

@riverpod
GetKuotaAccepted getKuotaAccepted(GetKuotaAcceptedRef ref) => GetKuotaAccepted(
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
    submission: ref.watch(submissionFretilizerRepositoryProvider));
