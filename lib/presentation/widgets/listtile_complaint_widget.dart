// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mol_petani/presentation/misc/constant.dart';

class ListTileComplaintWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final Function() onTap;
  const ListTileComplaintWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.007),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.01),
        decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width * 0.05),
            bottomRight: Radius.circular(width * 0.05),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: regulerReguler,
                ),
                Text(
                  subtitle,
                  style: regulerReguler,
                )
              ],
            ),
            Text(
              trailing,
              style: regulerReguler,
            )
          ],
        ),
      ),
    );
    ;
  }
}
