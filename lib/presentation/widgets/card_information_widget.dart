import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class CardInformationWidget extends StatelessWidget {
  final String title;
  final String information;
  const CardInformationWidget({
    required this.title,
    required this.information,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$title : ",
                style: regulerReguler,
              ),
              Text(
                information,
                style: regulerReguler,
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
