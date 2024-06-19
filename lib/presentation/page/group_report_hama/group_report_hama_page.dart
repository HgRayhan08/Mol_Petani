import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/listile_reporting_widget.dart';

class GroupReportHamaPage extends ConsumerWidget {
  const GroupReportHamaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laporan Hama",
          style: largeReguler,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(routerProvider)
                  .goNamed("group-history-submission-reporting");
            },
            icon: Icon(Icons.history),
          )
        ],
      ),
      body: FutureBuilder(
        future: ref
            .watch(reportProviderProvider.notifier)
            .getSubmissionReportHama(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTileReportingWidget(
                    title: data[index].name,
                    subtitle: data[index].nameFarmerGroup,
                    trailing: data[index].submissionDate,
                    onTap: () {
                      ref.read(routerProvider).goNamed(
                          "group-detail-submission-reporting",
                          extra: data[index]);
                    },
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ref.read(routerProvider).goNamed("form-report-hama");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
