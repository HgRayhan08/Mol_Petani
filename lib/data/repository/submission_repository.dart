import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';

abstract interface class SubmissionFretilizerRepository {
  // grup farmer
  Future<Result<DataSubmissionGroup>> createSubmissionFertilizer({
    required String idGrupFarmers,
    required String idPPL,
    required String leaderName,
    required String village,
    required String forYear,
    required String date,
    required String grupFarmer,
  });
  Future<Result<List<DataSubmissionGroup>>> getSubmissionFertilizerGroup(
      {required String idKelompoktani, required String information});
  Future<Result<DataSubmissionGroup>> getDetailSubmissionFertilizer(
      {required String id});
  Future<Result<SupportingDataFertilizer>> additionalDataSubmission({
    required String idSubmission,
    required String idKelompokTani,
    required String namaPetani,
    required String nik,
    required double luasLahan,
    required String fotoKtp,
    required String fotoKK,
    required String fotoPajak,
  });
  Future<Result<List<SupportingDataFertilizer>>> getadditionalDataSubmission(
      String idDocumennt);

  Future<Result<List<SubmissionKuotaFertilizer>>> getKuotaAccepted({
    required String idGrupFarmer,
    required String information,
  });

  Future<Result<String>> updateAcceptedFertilizer({
    required String idDocument,
    required int ureaUpdate,
    required int poskaUpdate,
    required String dateUpdate,
    required String sendName,
    required String recipientName,
  });

  // ppl
  Future<Result<SubmissionKuotaFertilizer>>
      createSubmissionKuotafertilizerGrup({
    required String idGrup,
    required String idSubmission,
    required String idPpl,
    required String leaderName,
    required String pplName,
    required String grupFarmer,
    required String village,
    required String distributorName,
    required int submission,
    required int urea,
    required int poska,
    required String dateOfFiling,
    required String forYear,
  });

  Future<Result<List<DataSubmissionGroup>>> getSubmissionFarmerGroup(
      {required String idPPL, required String information});

  Future<Result<String>> updateSubmission(
      {required int submission, required String id});

  Future<Result<List<SubmissionKuotaFertilizer>>> getkuotaFertilizer({
    required String idPPL,
    required String information,
  });

// distributor
  Future<Result<List<SubmissionKuotaFertilizer>>> getdataKuota({
    required String name,
    required String keterangan,
    required String informationSend,
  });
  Future<Result<String>> updateSubmissionkuota({
    required String idDocument,
    required String information,
    required String prosesDate,
  });

  Future<Result<String>> updateSendFertilizer({
    required String idDocument,
    required int ureaSend,
    required int poskaSend,
    required String datesend,
    required String sendName,
    required String recipientName,
  });
}
