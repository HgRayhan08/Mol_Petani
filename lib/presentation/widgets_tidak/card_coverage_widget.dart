import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class CardCoverageWidget extends StatefulWidget {
  final Function() ontap;
  final String title;
  const CardCoverageWidget(
      {super.key, required this.ontap, required this.title});

  @override
  State<CardCoverageWidget> createState() => _CardCoverageWidgetState();
}

class _CardCoverageWidgetState extends State<CardCoverageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 40,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: light,
                      border: Border(
                        top: BorderSide(color: blueLight),
                        left: BorderSide(color: blueLight),
                        right: BorderSide(color: blueLight),
                        bottom: BorderSide(color: blueLight),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(widget.title),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: widget.ontap,
                    child: const Icon(
                      Icons.close_sharp,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
