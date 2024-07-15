import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_supporting_data/method/web__supporting_information.dart';

class WebDetailSupporting extends StatelessWidget {
  final WidgetRef ref;
  final SupportingDataFertilizer data;
  const WebDetailSupporting({super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        children: [
          Text(
            "Detail Data Tambahan Petani",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(
            height: height * 0.04,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.55,
                  child: ListView(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text("Foto Kartu Keluarga",
                              style: regulerReguler)),
                      Image(
                        image: NetworkImage(data.fotoKK),
                        width: width * 0.5,
                        height: height * 0.5,
                      ),
                      SizedBox(height: height * 0.03),
                      Align(
                          alignment: Alignment.center,
                          child: Text("Foto Kartu Tanda Pengenal",
                              style: regulerReguler)),
                      Image(
                        image: NetworkImage(data.fotoKtp),
                        width: width * 0.5,
                        height: height * 0.5,
                      ),
                      SizedBox(height: height * 0.03),
                      Align(
                          alignment: Alignment.center,
                          child:
                              Text("Foto Buku Pajak", style: regulerReguler)),
                      Image(
                        image: NetworkImage(data.fotoPajak),
                        width: width * 0.5,
                        height: height * 0.5,
                      )
                    ],
                  ),
                ),
                informationSuppoting(data: data, width: width, height: height),
              ],
            ),
          ),
          SizedBox(height: height * 0.05),
        ],
      ),
    );
  }
}
