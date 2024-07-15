// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mol_petani/presentation/misc/constant.dart';

class ListTileCustomWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final double width;
  final double height;
  final Function() onTap;
  const ListTileCustomWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.width,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          ListTile(
            tileColor: background,
            contentPadding: EdgeInsets.only(top: height * 0.003),
            leading: Container(
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
            title: Text(
              title,
              style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subTitle),
            onTap: onTap,
          ),
          defaultTargetPlatform == TargetPlatform.iOS
              ? Divider(
                  height: 0,
                  indent: width * 0.15,
                )
              : Container(),
        ],
      ),
    );
  }
}
