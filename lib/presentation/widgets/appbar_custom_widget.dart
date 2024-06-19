import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class AppbarCustomWidget extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final String content;
  final Widget subContext;
  const AppbarCustomWidget({
    required this.height,
    required this.width,
    required this.title,
    required this.content,
    required this.subContext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blueLight,
      title: Text(
        title,
        // "detail Pelaporan",
        style: largeReguler,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      bottom: PreferredSize(
        preferredSize: Size(width, height * 0.1),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.03,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                content,
                style: largeReguler.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subContext,
            ],
          ),
        ),
      ),
    );
  }
}
