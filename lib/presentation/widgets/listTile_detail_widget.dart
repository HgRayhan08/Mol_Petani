import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class ListTileDetailWidget extends StatelessWidget {
  const ListTileDetailWidget({
    super.key,
    required this.width,
    required this.fill,
    required this.title,
  });

  final double width;
  final String title;
  final String fill;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: regulerReguler),
        Container(
          margin: EdgeInsets.symmetric(vertical: width * 0.02),
          width: width,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: dark,
                blurRadius: 5,
                offset: Offset(1, 2), // Shadow position
              ),
            ],
          ),
          child: Text(
            fill,
            style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
