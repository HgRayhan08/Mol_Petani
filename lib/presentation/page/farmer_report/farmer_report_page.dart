import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/listile_reporting_widget.dart';

class FarmerReportPage extends ConsumerWidget {
  const FarmerReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ref.watch(reportProviderProvider.notifier).getComplaintReport(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTileReportingWidget(
                  title: data[index].reporting,
                  subtitle: data[index].submissionDate,
                  trailing: data[index].information,
                  onTap: () {
                    ref.read(routerProvider).pushNamed(
                          "farmer-detail-complaint-reporting",
                          extra: data[index],
                        );
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ref.read(routerProvider).goNamed("farmer-create-report");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
