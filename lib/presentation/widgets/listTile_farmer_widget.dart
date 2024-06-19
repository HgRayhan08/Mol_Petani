import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:flutter/material.dart';

class ListTileFarmerWidget extends StatelessWidget {
  const ListTileFarmerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.data,
    required this.onTap,
  });

  final double width;
  final double height;
  final UserFarmer data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: height * 0.02),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: width * 0.03),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          border: Border(bottom: BorderSide(width: 2)),
          boxShadow: [
            BoxShadow(
              color: dark,
              blurRadius: 3,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: largeReguler.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Desa ${data.village}",
                  style: regulerReguler,
                ),
                Text(
                  data.jenisKelamin,
                  style: regulerReguler,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
