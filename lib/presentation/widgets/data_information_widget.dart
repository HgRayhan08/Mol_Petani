import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class DataInformation extends StatelessWidget {
  const DataInformation({
    super.key,
    required this.title,
    required this.information,
  });

  final String title;
  final String information;

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
