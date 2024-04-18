// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool boolSub;
  final Color colorTitle;
  const TitleWidget({
    Key? key,
    required this.title,
    this.subTitle,
    this.boolSub = false,
    this.colorTitle = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: regulerReguler.copyWith(color: colorTitle),
              ),
              boolSub == true
                  ? Text(
                      subTitle.toString(),
                      style:
                          regulerReguler.copyWith(fontWeight: FontWeight.bold),
                    )
                  : Container(),
            ],
          ),
          const Divider(
            thickness: 1.2,
            color: dark,
            height: 2,
          ),
        ],
      ),
    );
  }
}
