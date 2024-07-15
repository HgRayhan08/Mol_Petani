import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';

class DropdowsReport extends StatefulWidget {
  final Report data;
  final WidgetRef ref;
  const DropdowsReport({super.key, required this.data, required this.ref});

  @override
  State<DropdowsReport> createState() => _DropdowsReportState();
}

class _DropdowsReportState extends State<DropdowsReport> {
  bool isDropdown = false;

  void toggleDropdown() {
    setState(() {
      isDropdown = !isDropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.008),
      child: GestureDetector(
        onTap: toggleDropdown,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: blueLight),
            borderRadius: BorderRadius.circular(5),
          ),
          child: isDropdown
              ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      margin: EdgeInsets.only(bottom: height * 0.005),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.data.nameFarmer),
                          Text(widget.data.reporting),
                          Text(widget.data.submissionDate),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      margin: EdgeInsets.only(top: height * 0.005),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.02,
                      ),
                      // height: height * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.data.nameFarmer),
                                  Text(widget.data.information)
                                ],
                              ),
                              Text(widget.data.groupFarmer)
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Text(widget.data.reportingDetail),
                          SizedBox(height: height * 0.03),
                          ElevatedButton(
                            onPressed: () {
                              widget.ref
                                  .read(reportProviderProvider.notifier)
                                  .updateStatusComplaint(
                                      idDocument: widget.data.idDocument!);
                            },
                            child: Text("Terima"),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.data.nameFarmer),
                      Text(widget.data.reporting),
                      Text(widget.data.submissionDate),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
