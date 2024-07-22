import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class DropdownHistoryComplaint extends StatefulWidget {
  final Report data;
  final WidgetRef ref;
  const DropdownHistoryComplaint({
    super.key,
    required this.data,
    required this.ref,
  });

  @override
  State<DropdownHistoryComplaint> createState() =>
      _DropdownHistoryComplaintState();
}

class _DropdownHistoryComplaintState extends State<DropdownHistoryComplaint> {
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
                              Text(widget.data.farmerGroup)
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Text(widget.data.detailReporting),
                          SizedBox(height: height * 0.03),
                        ],
                      ),
                    )
                    // Add more widgets if needed when dropdown is true
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
