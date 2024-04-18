import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class CardSubMenu extends StatelessWidget {
  final String image;
  final String title;
  final Function() onTap;
  const CardSubMenu({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: light,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  image,
                  width: 50,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  title,
                  style: smallReguler.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
