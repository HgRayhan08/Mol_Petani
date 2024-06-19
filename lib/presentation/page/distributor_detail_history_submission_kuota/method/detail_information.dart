// import 'package:flutter/material.dart';
// import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
// import 'package:mol_petani/presentation/misc/constant.dart';

// Widget detailInformation(width, height, {SubmissionKuotaFertilizer? data}) =>
//     Container(
//       padding: EdgeInsets.all(width * 0.04),
//       decoration: BoxDecoration(
//         border: Border.all(),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Penyuluh Pertanian Lapangan",
//             style: regulerReguler,
//           ),
//           Text(
//             data!.pplName,
//             style: regulerReguler.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: height * 0.02,
//           ),
//           Text(
//             "Kelompok Tani",
//             style: regulerReguler,
//           ),
//           Text(
//             "Kelompok ${data.grupFarmer}",
//             style: regulerReguler.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: height * 0.02,
//           ),
//           Text(
//             "Ketua Kelompok Tani",
//             style: regulerReguler,
//           ),
//           Text(
//             data.leaderName,
//             style: regulerReguler.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: height * 0.02,
//           ),
//           Text(
//             "Desa",
//             style: regulerReguler,
//           ),
//           Text(
//             data.village,
//             style: regulerReguler.copyWith(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
