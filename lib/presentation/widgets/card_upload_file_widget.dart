import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/show_dialog_widget.dart';

class CardUploadFileWidget extends StatefulWidget {
  late XFile? xfile;
  String? image;
  final String title;
  Function()? func;

  CardUploadFileWidget({
    super.key,
    required this.xfile,
    this.image,
    required this.title,
    required this.func,
  });

  @override
  State<CardUploadFileWidget> createState() => _CardUploadFileWidgetState();
}

class _CardUploadFileWidgetState extends State<CardUploadFileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: regulerReguler.copyWith(
            color: dark,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: MediaQuery.of(context).size.height * 0.22,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.19,
                child: widget.image != null
                    ? Image.network(
                        widget.image!,
                        fit: BoxFit.cover,
                      )
                    : DottedBorder(
                        dashPattern: const [10, 5],
                        strokeWidth: 1,
                        child: const Center(
                          child: Text("Image"),
                        ),
                      ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: widget.func,
                  child: const Text("Upload"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
