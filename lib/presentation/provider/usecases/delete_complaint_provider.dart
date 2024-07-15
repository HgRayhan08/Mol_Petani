import 'package:mol_petani/domain/usecase/delete_complaint/delete_complaint.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_complaint_provider.g.dart';

@riverpod
DeleteComplaint deleteComplaint(DeleteComplaintRef ref) =>
    DeleteComplaint(reportRepository: ref.watch(reportRepositoryProvider));
