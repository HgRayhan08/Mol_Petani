import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class CardSubmissionFertilizer extends ConsumerWidget {
  const CardSubmissionFertilizer({
    super.key,
    required this.data,
  });

  final DataSubmissionFertilizer data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref
            .read(routerProvider)
            .pushNamed("data-submission-farmer", extra: data);
      },
      child: Card(
        child: Column(
          children: [
            // if (data.keterangan == "Proses Pengajuan")
            //   Container(
            //     padding: EdgeInsets.only(
            //       top: MediaQuery.of(context).size.width * 0.02,
            //       bottom: MediaQuery.of(context).size.width * 0.02,
            //       right: MediaQuery.of(context).size.width * 0.05,
            //     ),
            //     height: MediaQuery.of(context).size.height * 0.04,
            //     width: double.infinity,
            //     decoration: const BoxDecoration(
            //       color: blueInfo,
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20),
            //       ),
            //     ),
            //     child: Text(
            //       "Proses Pengajuan",
            //       style: regulerReguler.copyWith(
            //           fontSize: 14, fontWeight: FontWeight.bold, color: dark),
            //       textAlign: TextAlign.end,
            //     ),
            //   ),
            if (data.keterangan == "Pengajuan")
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.02,
                  bottom: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                height: MediaQuery.of(context).size.height * 0.04,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: yellowInfo,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "Sedang Di Proses",
                  style: regulerReguler.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold, color: dark),
                  textAlign: TextAlign.end,
                ),
              ),
            if (data.keterangan == "Selesai")
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.02,
                  bottom: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                height: MediaQuery.of(context).size.height * 0.04,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: greenInfo,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "Selesai",
                  style: regulerReguler.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold, color: dark),
                  textAlign: TextAlign.end,
                ),
              ),
            Container(
              decoration: const BoxDecoration(
                color: light,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ListTile(
                title: Text(
                  // data.leaderName,
                  data.idDocument!,
                  style: largeReguler.copyWith(fontSize: 18),
                ),
                trailing: Text(
                  data.forYear,
                  style: regulerReguler,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
