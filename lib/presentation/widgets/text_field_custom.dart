import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class TextFieldCustom extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;
  final bool iconButton;
  final String title;
  final double? width;
  const TextFieldCustom({
    super.key,
    required this.hinttext,
    required this.controller,
    this.iconButton = false,
    required this.title,
    this.width = double.infinity,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: regulerReguler.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: widget.width,
          child: Material(
            child: TextFormField(
              controller: widget.controller,
              obscureText: _obscureText,
              decoration: InputDecoration(
                filled: true,
                fillColor: background,
                contentPadding: const EdgeInsets.only(
                    left: 15, top: 15, bottom: 15, right: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: widget.hinttext,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
