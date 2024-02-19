import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/petani_pupuk.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class DetailDataFertilizerFarmerPage extends ConsumerWidget {
  final PetaniPupuk data;
  const DetailDataFertilizerFarmerPage(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.namaPetani),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              Column(
                children: [
                  Image.network(
                    data.fotoKK,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Text(
                    "Foto Kartu Keluarga",
                    style: largeReguler,
                  )
                ],
              ),
              Column(
                children: [
                  Image.network(
                    data.fotoKtp,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Text(
                    "Foto KTP",
                    style: largeReguler,
                  )
                ],
              ),
              Column(
                children: [
                  Image.network(
                    data.fotoPajak,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Text(
                    "Foto Buku Pajak",
                    style: largeReguler,
                  )
                ],
              ),
            ],
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 1.0,
            ),
          )
          // CarouselSlider.builder(
          //   itemCount: 3,
          //   itemBuilder: (context, itemIndex, pageViewIndex) =>
          //       Container(child: Image.network(data.fotoKK)),
          //   options: CarouselOptions(
          //     autoPlay: false,
          //     enlargeCenterPage: true,
          //     viewportFraction: 0.9,
          //     aspectRatio: 2.0,
          //     initialPage: 2,
          //   ),
          // )
        ],
      ),
    );
  }
}
