import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget formReportHama(
  TextEditingController? reportingController,
  TextEditingController? detailReportingController,
  height,
) =>
    Column(
      children: [
        SizedBox(height: height * 0.02),
        Material(
          child: TextFormField(
            controller: reportingController,
            decoration: InputDecoration(
              label: Text(
                "Judul Pelaporan",
                style: regulerReguler,
              ),
              hintText: "Judul Pelaporan",
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Material(
          child: TextFormField(
            controller: detailReportingController,
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
            decoration: InputDecoration(
              label: Text(
                "Detail Pelaporan",
                style: regulerReguler,
              ),
              hintText: "Detail Pelaporan",
            ),
          ),
        ),
      ],
    );
