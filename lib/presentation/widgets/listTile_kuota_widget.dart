import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class ListTileKuotaWidget extends StatelessWidget {
  const ListTileKuotaWidget({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.subTitle,
    required this.year,
    required this.submission,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final String year;
  final String submission;
  final double width;
  final double height;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(width * 0.02),
        margin: EdgeInsets.only(top: height * 0.01),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          border: Border(
            bottom: BorderSide(
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: width * 0.13,
                  height: width * 0.13,
                  decoration: const BoxDecoration(
                    color: greenLeaf,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      submission,
                      style: extraLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kelompok ${title.toString()}",
                      style:
                          regulerReguler.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text("Pengawas ${subTitle.toString()}"),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.05),
              child: Text(
                year,
                style: regulerReguler.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
