import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_submission_widget.dart';

class MobileAdditionalFertilizer extends StatelessWidget {
  final DataSubmissionGroup data;
  final WidgetRef ref;
  const MobileAdditionalFertilizer(
      {super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: defaultTargetPlatform == TargetPlatform.iOS
              ? EdgeInsets.only(
                  top: height * 0.03,
                  left: width * 0.05,
                  right: width * 0.05,
                )
              : const EdgeInsets.all(0),
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: 15,
          ),
          decoration: BoxDecoration(
            color: blueLight,
            borderRadius: defaultTargetPlatform == TargetPlatform.iOS
                ? BorderRadius.all(Radius.circular(width * 0.05))
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              // ProcessSubmissionWidget(
              //   submission: data.submission,
              // ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.leaderName,
                        style: largeReguler.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(data.farmerGroup,
                          style: largeReguler.copyWith(
                              color: Colors.white, fontSize: 18)),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "Desa ${data.village}",
                        style: largeReguler.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Pengajuan Tahun",
                        style: smallReguler.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        data.forYear,
                        style: largeReguler.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data Petani",
                style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
              ),
              Divider(
                color: dark,
                thickness: 1,
                height: 5,
                endIndent: width * 0.3,
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: ref
              .watch(fertilizerSubmissionProvider.notifier)
              .getDataSubmisiionFarmer(
                idKelompok: data.idDocument.toString(),
              ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var pengajuan = snapshot.data!;
                    return ListTileSubmissionWidget(
                      title: pengajuan[index].farmername,
                      subTitle: pengajuan[index].nik,
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        ref.read(routerProvider).pushNamed(
                            "detail-supporting-grup",
                            extra: pengajuan[index]);
                      },
                    );
                  },
                ),
              );
            } else {
              return const Text("Kosong");
            }
          },
        ),
      ],
    );
  }
}
