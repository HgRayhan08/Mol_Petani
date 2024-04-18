import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_fertilizer_farmer/create_fertilizer_farmer_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateFertilizerFarmer
    implements
        UseCase<Result<SupportingDataFertilizer>,
            CreateFertilizerFarmerParams> {
  final SubmissionFretilizerRepository submissionFretilizerRepository;
  final SharedPrefRepository sharedPrefRepository;
  final UserRepository userRepository;

  CreateFertilizerFarmer({
    required this.submissionFretilizerRepository,
    required this.sharedPrefRepository,
    required this.userRepository,
  });

  @override
  Future<Result<SupportingDataFertilizer>> call(
      CreateFertilizerFarmerParams params) async {
    List<String>? idUser = await sharedPrefRepository.getDataLogin();
    String imagektp =
        await userRepository.uploadImage(imageFile: params.fotoKtp);
    String imageKk = await userRepository.uploadImage(imageFile: params.fotoKK);
    String imagePajak =
        await userRepository.uploadImage(imageFile: params.fotoPajak);
    // if (imagektp.isNotEmpty || imageKk.isNotEmpty || imagePajak.isNotEmpty) {
    var result = await submissionFretilizerRepository.additionalDataSubmission(
      idSubmission: params.idSubmission,
      idKelompokTani: idUser![1],
      namaPetani: params.namaPetani,
      nik: params.nik,
      luasLahan: params.luasLahan,
      fotoKtp: imagektp,
      fotoKK: imageKk,
      fotoPajak: imagePajak,
    );
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
    // } else {
    //   return Result.failed("message");
    // }
  }
}
