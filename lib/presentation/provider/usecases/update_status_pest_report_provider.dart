import 'package:mol_petani/domain/usecase/update_status_pest_report/update_ststus_pest_report.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "update_status_pest_report_provider.g.dart";

@riverpod
UpdateStstusPestReport updateStstusPestReport(UpdateStstusPestReportRef ref) =>
    UpdateStstusPestReport(
      reportRepository: ref.watch(reportRepositoryProvider),
    );
