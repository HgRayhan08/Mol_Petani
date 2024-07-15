import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/title_widget.dart';

class MobileDetailSupporting extends StatelessWidget {
  final WidgetRef ref;
  final SupportingDataFertilizer data;
  const MobileDetailSupporting(
      {super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: width,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: blueLight,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.01),
                child: Text(
                  "Data Pengajuan",
                  style: largeReguler.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              TitleWidget(
                title: "Nama",
                subTitle: data.namaPetani,
                boolSub: true,
                colorTitle: Colors.white,
              ),
              TitleWidget(
                title: "Nomor Induk Keluarga",
                subTitle: data.nik,
                boolSub: true,
                colorTitle: Colors.white,
              ),
              TitleWidget(
                title: "Luas Lahan",
                subTitle: data.luasLahan.toString(),
                boolSub: true,
                colorTitle: Colors.white,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            children: [
              const TitleWidget(
                title: "Kartu Tanda Pengenal",
              ),
              Image(
                image: NetworkImage(data.fotoKtp),
                height: height * 0.3,
                width: double.infinity,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const TitleWidget(
                title: "Kartu Keluarga",
              ),
              Image(
                image: NetworkImage(data.fotoKK),
                height: height * 0.3,
                width: double.infinity,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const TitleWidget(
                title: "Buku Pajak",
              ),
              Image(
                image: NetworkImage(data.fotoPajak),
                height: height * 0.3,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
