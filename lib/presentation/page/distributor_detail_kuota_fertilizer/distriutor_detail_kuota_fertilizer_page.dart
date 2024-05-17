import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor_detail_kuota_fertilizer/method/information_submission.dart';
import 'package:mol_petani/presentation/page/distributor_detail_kuota_fertilizer/method/kuota_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class DistributorDetailKuotaFertilizerPage extends ConsumerStatefulWidget {
  final SubmissionKuotaFertilizer data;
  const DistributorDetailKuotaFertilizerPage(this.data, {super.key});

  @override
  ConsumerState<DistributorDetailKuotaFertilizerPage> createState() =>
      _DistributorDetailKuotaFertilizerPageState();
}

class _DistributorDetailKuotaFertilizerPageState
    extends ConsumerState<DistributorDetailKuotaFertilizerPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;
    bool isSunmission = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Pengajuan Pupuk",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(width * 0.05),
        children: [
          Text(
            "Pengajuan Pupuk Distributor",
            style: regulerReguler,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          kuotaInformation(
            width,
            height,
            data: widget.data,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            "Keterangan",
            style: regulerReguler,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          informationSubmission(
            width,
            height,
            data: widget.data,
          ),
          SizedBox(
            height: height * 0.5,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, height * 0.13),
              backgroundColor: blueLight,
            ),
            onPressed: widget.data.information != "Proses"
                ? () async {
                    // print("proses");
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Apakah Anda yakin?'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Klik Yes untuk Setuju'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Yes'),
                              onPressed: () async {
                                await ref
                                    .read(fertilizerSubmissionProvider.notifier)
                                    .updateSubmissionFertilizer(
                                        idDocument:
                                            widget.data.idDocument.toString());
                                setState(() {
                                  isSunmission == true;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    if (isSunmission = true) {
                      ref.read(routerProvider).pop();
                    }
                  }
                : () {
                    ref.read(routerProvider).pushNamed("forms-sends-fertilizer",
                        extra: widget.data);
                  },
            child: Text(
              widget.data.information != "Proses" ? "Prosess" : "Submission",
              style: buttonReguler.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
