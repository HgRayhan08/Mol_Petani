// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/material.dart';
// import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
// import 'package:mol_petani/presentation/widgets_tidak/card_submission_fertilizer_widget.dart';

// class DataCompletedSubmissionGrup extends ConsumerWidget {
//   const DataCompletedSubmissionGrup({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: ref
//             .watch(dataUserProvider.notifier)
//             .getSubmissionFertilizerFarmerGrup(
//               keterangan: "Selesai",
//             ),
//         builder: ((context, snapshot) {
//           var data = snapshot.data;
//           if (snapshot.hasData) {
//             return ListView.builder(
//               padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.width * 0.02),
//               itemCount: data!.length,
//               itemBuilder: (context, index) {
//                 return CardSubmissionFertilizer(data: data[index]);
//               },
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }),
//       ),
//     );
//   }
// }
