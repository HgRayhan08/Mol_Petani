import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_group/mobile/mobile_form_submission.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_group/website/web_form_submission.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

// class GroupFormSubmissionGroupPage extends ConsumerWidget {
//    GroupFormSubmissionGroupPage({super.key});

//   final TextEditingController tahunControler = TextEditingController();
//   final TextEditingController nameControler = TextEditingController();
//   final TextEditingController villageControler = TextEditingController();
//   final TextEditingController grupControler = TextEditingController();
//   String? dateControler;
//   final DateTime date = DateTime.now();
//   final year = DateTime.now();

//   Widget buildAndroid(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Create Submission Vertilizer",
//           style: regulerReguler.copyWith(fontSize: 18),
//         ),
//       ),
//       body: MobileFormSubmission(
//           ref: ref,
//           tahunControler: tahunControler,
//           nameControler: nameControler,
//           villageControler: villageControler,
//           grupControler: grupControler,
//           dateControler: dateControler!,
//           date: date,
//           year: year),
//     );
//   }

//   Widget buildIos(BuildContext context, WidgetRef ref) {
//     return CupertinoApp(
//       localizationsDelegates: const [
//         DefaultMaterialLocalizations.delegate,
//         DefaultCupertinoLocalizations.delegate,
//         DefaultWidgetsLocalizations.delegate,
//       ],
//       title: "Create Submission Vertilizer",
//       home: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           leading: IconButton(
//             onPressed: () {
//               ref.read(routerProvider).goNamed("detail-accepted-grup");
//             },
//             icon: const Icon(Icons.arrow_back_ios),
//           ),
//           middle: Text(
//             "Create Submission Vertilizer",
//             style: largeReguler,
//           ),
//           trailing: IconButton(
//             onPressed: () {
//               if (nameControler.text == "" ||
//                   villageControler.text == "" ||
//                   tahunControler.text == "" ||
//                   grupControler.text == "") {
//                 context.buildAlertInformation(
//                     title: "Pesan",
//                     subTitle: "Please enter the data completely");
//               } else if (int.parse(tahunControler.text) <= date.year) {
//                 context.buildAlertInformation(
//                     title: "Pesan", subTitle: "please input next year");
//               } else {
//                 context.buildAlertInformation(
//                     title: "Pesan", subTitle: "Berhasil Menambahkan Data");
//                 ref
//                     .read(fertilizerSubmissionProvider.notifier)
//                     .createSubmissionFertilizerFarmerGrup(
//                       namaKetua: nameControler.text,
//                       desa: villageControler.text,
//                       forYear: tahunControler.text,
//                       tanggal: DateFormat("dd-MM-yyyy").format(date).toString(),
//                       grupFarmer: grupControler.text,
//                     );

//                 Future.delayed(
//                   const Duration(seconds: 5),
//                   () {
//                     ref.read(routerProvider).pop();
//                   },
//                 );
//                 // print(date.year);
//               }
//             },
//             icon: const Icon(Icons.check),
//           ),
//         ),
//         child: SafeArea(
//           child: MobileFormSubmission(
//               ref: ref,
//               tahunControler: tahunControler,
//               nameControler: nameControler,
//               villageControler: villageControler,
//               grupControler: grupControler,
//               dateControler: dateControler.toString(),
//               date: date,
//               year: year),
//         ),
//       ),
//     );
//   }

//   Widget buildWeb(BuildContext context, WidgetRef ref) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return SizedBox(
//       width: width * 0.7,
//       height: height * 0.8,
//       child: Scaffold(
//         appBar: AppBar(
//           surfaceTintColor: Colors.transparent,
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           leadingWidth: width * 0.06,
//           leading: IconButton(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(0),
//                 ),
//               ),
//               onPressed: () {
//                 // ref.read(routerProvider).pop();
//                 Navigator.of(context).pop();
//                 // context.pop();
//               },
//               icon: const Icon(Icons.cancel)),
//         ),
//         body: WebFormSubmission(
//           ref: ref,
//           // tahunControler: tahunControler,
//           // nameControler: nameControler,
//           // villageControler: villageControler,
//           // grupControler: grupControler,
//           // dateControler: dateControler!,
//           // date: date,
//           // year: year,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return PlatformWidget(
//         androidBuilder: buildAndroid,
//         iosBuilder: buildIos,
//         webBuilder: buildWeb);
//   }
// }

class GroupFormSubmissionGroupPage extends ConsumerStatefulWidget {
  const GroupFormSubmissionGroupPage({super.key});

  @override
  ConsumerState<GroupFormSubmissionGroupPage> createState() =>
      _GroupFormSubmissionGroupPageState();
}

class _GroupFormSubmissionGroupPageState
    extends ConsumerState<GroupFormSubmissionGroupPage> {
  final TextEditingController tahunControler = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController villageControler = TextEditingController();
  final TextEditingController grupControler = TextEditingController();
  String? dateControler;
  final DateTime date = DateTime.now();
  final year = DateTime.now();

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Submission Vertilizer",
          style: regulerReguler.copyWith(fontSize: 18),
        ),
      ),
      body: MobileFormSubmission(
        ref: ref,
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Create Submission Vertilizer",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("detail-accepted-grup");
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Create Submission Vertilizer",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileFormSubmission(
            ref: ref,
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.7,
      height: height * 0.8,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: width * 0.06,
          leading: IconButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                // ref.read(routerProvider).pop();
                Navigator.of(context).pop();
                // context.pop();
              },
              icon: const Icon(Icons.cancel)),
        ),
        body: WebFormSubmission(
          ref: ref,
          // tahunControler: tahunControler,
          // nameControler: nameControler,
          // villageControler: villageControler,
          // grupControler: grupControler,
          // dateControler: dateControler!,
          // date: date,
          // year: year,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
