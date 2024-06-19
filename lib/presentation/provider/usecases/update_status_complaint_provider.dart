import 'package:mol_petani/domain/usecase/update_status_complaint/update_status_complaint.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "update_status_complaint_provider.g.dart";

@riverpod
UpdateStstusComplaint updateStstusComplaint(UpdateStstusComplaintRef ref) =>
    UpdateStstusComplaint(
        reportRepository: ref.watch(reportRepositoryProvider));
