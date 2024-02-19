import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_submission_fertilizer_farmer/create_fertilizer_farmer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateSubmissionFarmer
    implements UseCase<Result<PetaniPupuk>, CreateFertilizerFarmerParams> {
  final SubmissionFretilizerRepository submissionFretilizerRepository;
  final SharedPrefRepository sharedPrefRepository;

  CreateSubmissionFarmer({
    required this.submissionFretilizerRepository,
    required this.sharedPrefRepository,
  });

  @override
  Future<Result<PetaniPupuk>> call(CreateFertilizerFarmerParams params) async {
    List<String>? idUser = await sharedPrefRepository.getDataLogin();
    var result = await submissionFretilizerRepository.createFertilizerFarmer(
        idSubmission: params.idSubmission,
        idKelompokTani: idUser![1],
        namaPetani: params.namaPetani,
        nik: params.nik,
        luasLahan: params.luasLahan,
        fotoKtp: params.fotoKtp,
        fotoKK: params.fotoKK,
        fotoPajak: params.fotoPajak);
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}
