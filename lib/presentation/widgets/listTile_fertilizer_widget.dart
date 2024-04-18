import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class ListTileFertilizer extends StatelessWidget {
  const ListTileFertilizer({
    super.key,
    required this.data,
    required this.onTap,
  });

  final Function() onTap;
  final DataSubmissionGroup data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
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
                  data.leaderName,
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  data.grupFarmer,
                  style: regulerReguler,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data.forYear,
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Penngajuan ${data.submission.toString()}",
                  style: regulerReguler,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
