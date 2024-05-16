import 'package:mol_petani/data/Complaint/monitoring_report.dart';
import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "report_repository_provider.g.dart";

@riverpod
ReportRepository reportRepository(ReportRepositoryRef ref) =>
    MonitoringReport();
