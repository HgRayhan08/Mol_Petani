import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageWidget extends StatefulWidget {
  XFile? xfile;
  UploadImageWidget({super.key, required this.xfile});

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.xfile != null) {
          return showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('AlertDialog Title'),
                content: const SingleChildScrollView(
                  child: Text("Apakah anda yakin menghaous"),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('yes'),
                    onPressed: () async {
                      widget.xfile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      setState(
                        () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
          widget.xfile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          setState(
            () {},
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: widget.xfile != null
            ? Image.file(
                File(widget.xfile!.path),
                fit: BoxFit.cover,
              )
            : const Center(
                child: Icon(Icons.add),
              ),
      ),
    );
  }
}
