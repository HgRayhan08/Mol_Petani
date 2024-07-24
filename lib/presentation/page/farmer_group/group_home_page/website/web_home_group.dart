import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class WebHomeGroub extends StatelessWidget {
  const WebHomeGroub({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/logo.png"),
          ),
          Text(
            "Monitoring Lahan Pertanin Petani",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
