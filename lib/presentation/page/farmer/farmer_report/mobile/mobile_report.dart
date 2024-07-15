import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/listile_reporting_widget.dart';

class MobileReport extends StatefulWidget {
  final WidgetRef ref;
  const MobileReport({super.key, required this.ref});

  @override
  State<MobileReport> createState() => _MobileReportState();
}

class _MobileReportState extends State<MobileReport> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: widget.ref
          .watch(reportProviderProvider.notifier)
          .getComplaintReport(),
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
                  widget.ref.read(routerProvider).pushNamed(
                        "farmer-detail-complaint-reporting",
                        extra: data[index],
                      );
                  setState(() {});
                },
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
