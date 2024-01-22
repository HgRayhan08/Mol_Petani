import 'package:flutter/material.dart';

class CardLoginWith extends StatelessWidget {
  final Widget content;
  final Function() onTap;
  const CardLoginWith({
    super.key,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * 0.28,
        // padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: const Color(0xffECF9FF),
            border: Border.all(
              width: 2,
              color: Colors.transparent,
            ),
            boxShadow: const [
              BoxShadow(
                spreadRadius: 3,
                // blurRadius: 5,
                offset: Offset(2, 3),
                color: Color(0xffECF9FF),
              )
            ],
            borderRadius: BorderRadius.circular(15)),
        child: content,
      ),
    );
  }
}
