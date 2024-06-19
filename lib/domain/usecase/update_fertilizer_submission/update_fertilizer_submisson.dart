// import 'package:mol_petani/data/repository/fertilizer_repository.dart';
// import 'package:mol_petani/domain/entities/result.dart';
// import 'package:mol_petani/domain/usecase/update_fertilizer_submission/update_submission_params.dart';
// import 'package:mol_petani/domain/usecase/usecase.dart';

// class UpdateFertilizerSubmisson
//     implements UseCase<Result<String>, UpdateSubmissionParams> {
//   final FertilizerRepository fertilizerRepository;

//   UpdateFertilizerSubmisson({required this.fertilizerRepository});

//   @override
//   Future<Result<String>> call(UpdateSubmissionParams params) async {
//     var result = await fertilizerRepository.updateSubmission(
//         submission: params.submission, id: params.idDocument);

//     if (result.isSuccess) {
//       return const Result.success("succes update data");
//     } else {
//       return const Result.failed("failed update data");
//     }
//   }
// }
