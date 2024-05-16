import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class CardLoginWith extends StatelessWidget {
  final Widget content;
  final Function() onTap;
  final num width;
  const CardLoginWith({
    super.key,
    required this.content,
    required this.onTap,
    this.width = 0.28,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * width,
        // padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: light,
            border: Border.all(
              width: 2,
              color: Colors.transparent,
            ),
            boxShadow: const [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(1, 2),
                color: Color.fromARGB(255, 235, 235, 235),
              )
            ],
            borderRadius: BorderRadius.circular(15)),
        child: content,
      ),
    );
  }
}
