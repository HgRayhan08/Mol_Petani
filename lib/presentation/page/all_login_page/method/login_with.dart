import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets_tidak/card_login_with.dart';

Widget loginWith(
  ref, {
  String? first,
  String? seccond,
  String? thrid,
  required String? toPageFirst,
  required String? toPageSecond,
  required String? toPagethrid,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardLoginWith(
            content: Text(
              first!,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
            onTap: () {
              ref.read(routerProvider).goNamed(toPageFirst.toString());
            }),
        CardLoginWith(
            content: Text(
              seccond!,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
            onTap: () {
              ref.read(routerProvider).goNamed(toPageSecond.toString());
            }),
        CardLoginWith(
          content: Text(
            thrid!,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
          ),
          onTap: () {
            ref.read(routerProvider).goNamed(toPagethrid.toString());
          },
        ),
      ],
    );
