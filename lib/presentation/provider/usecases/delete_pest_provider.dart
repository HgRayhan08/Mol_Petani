import 'package:mol_petani/domain/usecase/delete_pest/delete_pest.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_pest_provider.g.dart';

@riverpod
DeletePest deletePest(DeletePestRef ref) =>
    DeletePest(reportRepository: ref.watch(reportRepositoryProvider));
