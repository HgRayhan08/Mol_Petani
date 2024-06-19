import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';

abstract interface class FertilizerRepository {
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

  Future<Result<List<SubmissionKuotaFertilizer>>> getDistributionGroupFarmer({
    required String idPPL,
    required String idGroupFarmer,
    required String information,
  });

  Future<Result<DistributionFertilizerFarmer>> createDistributionFarmer({
    required String idGroupFarmer,
    required String idUserFarmer,
    required String idPPL,
    required String farmerName,
    required String year,
    required String distribution,
    required String distribusiDate,
    required int ureaDistribution,
    required int poskaDistribution,
  });

  Future<Result<String>> updateDistributionFarmer({
    required String idDocument,
    required int acceptUrea,
    required int acceptPoska,
    required String acceptDate,
    required String nameAcceptGroupFarmer,
    required String nameSendDistributor,
  });

  Future<Result<List<DistributionFertilizerFarmer>>> getsendFertilizerFarmer({
    required String idFarmer,
    required String idGroupFarmer,
  });
  // end Group farmer

  // ppl
  Future<Result<List<DataSubmissionGroup>>> getSubmissionFarmerGroup(
      {required String idPPL, required String idGroupFarmer});

  Future<Result<List<SubmissionKuotaFertilizer>>> getDataMonitoring(
      {required String idPPL, required String idGroupFarmer});

  // end ppl

// distributor
  Future<Result<SubmissionKuotaFertilizer>> createSendFertilizerGroup({
    required String idPPL,
    required String idGroupFarmer,
    required String idDistributor,
    required String sendDate,
    required String leaderName,
    required String nameDistributor,
    required String nameGroupFarmer,
    required String year,
    required int send,
    required int sendUrea,
    required int sendPoska,
  });

  Future<Result<List<SubmissionKuotaFertilizer>>>
      getDistributionFertilizerGroup({
    required String idPPL,
    required String idDistributor,
    required String information,
  });

  Future<Result<String>> updateSubmissionkuota({
    required String idDocument,
    required String information,
    required String prosesDate,
  });

  // Farmer
  Future<Result<String>> updateSendFertilizer({
    required String idDocument,
    required String pickupDate,
    required String plant,
    required int ureaPickup,
    required int poskaPickup,
  });
  Future<Result<List<DistributionFertilizerFarmer>>> getAcceptFertilizerFarmer({
    required String idUserFarmer,
    required String idGroupFarmer,
  });
}
