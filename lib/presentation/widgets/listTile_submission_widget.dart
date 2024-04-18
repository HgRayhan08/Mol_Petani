import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class ListTileSubmissionWidget extends StatelessWidget {
  const ListTileSubmissionWidget(
      {super.key,
      required this.trailing,
      required this.onTap,
      required this.title,
      required this.subTitle});
  final Widget trailing;
  final String title;
  final String subTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: width * 0.03),
        padding: const EdgeInsets.all(15),
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: dark,
              blurRadius: 5,
              offset: Offset(1, 3), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(subTitle)
              ],
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
