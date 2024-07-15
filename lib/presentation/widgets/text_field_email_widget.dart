import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class TextFieldEmailWidget extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;
  final bool iconButton;
  final String title;
  final double? width;
  const TextFieldEmailWidget({
    super.key,
    required this.hinttext,
    required this.controller,
    this.iconButton = false,
    required this.title,
    this.width = double.infinity,
  });

  @override
  State<TextFieldEmailWidget> createState() => _TextFieldEmailWidgetState();
}

class _TextFieldEmailWidgetState extends State<TextFieldEmailWidget> {
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
          child: TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!EmailValidator.validate(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 15, top: 15, bottom: 15, right: 20),
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
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
