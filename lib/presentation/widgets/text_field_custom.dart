import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;
  final bool iconButton;
  const TextFieldCustom({
    super.key,
    required this.hinttext,
    required this.controller,
    this.iconButton = false,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hinttext,
        suffixIcon: widget.iconButton == false
            ? null
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                )),
      ),
    );
  }
}
