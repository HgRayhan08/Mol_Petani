import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_complaint_widget.dart';

class PplComplaintReportPage extends ConsumerWidget {
  const PplComplaintReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ref
              .watch(reportProviderProvider.notifier)
              .getComplaintReportFarmer(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTileComplaintWidget(
                    title: data[index].reporting,
                    subtitle: data[index].nameFarmer,
                    trailing: data[index].submissionDate,
                    onTap: () {
                      print("object");
                      // ref.read(routerProvider).pushNamed(
                      //       "detail-complaint",
                      //       extra: data[index],
                      //     );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
