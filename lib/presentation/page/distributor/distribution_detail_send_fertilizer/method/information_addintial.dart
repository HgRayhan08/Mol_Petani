import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/widgets/card_information_widget.dart';

Widget informationAddintion(SubmissionKuotaFertilizer data, width) => Container(
      padding: EdgeInsets.all(width * 0.05),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          CardInformationWidget(
            title: "Keterangan",
            information: data.information,
          ),
          CardInformationWidget(
            title: "Tanggal Penngiriman",
            information: data.sendDate,
          ),
          CardInformationWidget(
            title: "Tanggal Penerimaan",
            information: "belum",
          ),
          CardInformationWidget(
            title: "Urea Yang dikirim",
            information: data.sendUrea.toString(),
          ),
          CardInformationWidget(
            title: "Poska yang dikirim",
            information: data.sendPoska.toString(),
          ),
          CardInformationWidget(
            title: "Urea Yang diterima",
            information: data.acceptUrea.toString(),
          ),
          CardInformationWidget(
            title: "Poska yang diterima",
            information: data.acceptPoska.toString(),
          ),
          CardInformationWidget(
            title: "Nama Pengirim",
            information: data.nameSendDistributor,
          ),
          CardInformationWidget(
            title: "Nama Penerima",
            information: data.nameAcceptFarmerGroup,
          ),
        ],
      ),
    );
