import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/usecase/get_data_kuota_fertilizer/kuota_on_distributor_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetDataKuota
    implements
        UseCase<Result<List<SubmissionKuotaFertilizer>>,
            KuotaOnDistributorParams> {
  final SubmissionFretilizerRepository submission;
  final SharedPrefRepository sharedPrefRepository;

  GetDataKuota({required this.submission, required this.sharedPrefRepository});

  @override
  Future<Result<List<SubmissionKuotaFertilizer>>> call(
      KuotaOnDistributorParams params) async {
    List<String>? username = await sharedPrefRepository.getDataLogin();
    var data = await submission.getdataKuota(
      name: username![2],
      keterangan: params.keterangan,
      informationSend: params.informationSend,
    );
    // print(data.resultValue!.length);
    return switch (data) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
