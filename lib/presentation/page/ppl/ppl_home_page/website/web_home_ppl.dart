import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class WebHomePpl extends ConsumerWidget {
  const WebHomePpl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("assets/logo.png"),
        ),
        Text(
          "Monitoring Lahan Pertanin Petani",
          style: extraLarge.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
