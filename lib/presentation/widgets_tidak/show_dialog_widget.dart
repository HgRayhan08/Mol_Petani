import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'dart:io';

class ShowDialogWidget extends ConsumerStatefulWidget {
  late XFile? xfile;

  ShowDialogWidget({
    super.key,
    required this.xfile,
  });

  @override
  ConsumerState<ShowDialogWidget> createState() => _ShowDialogWidgetState();
}

class _ShowDialogWidgetState extends ConsumerState<ShowDialogWidget> {
  String? gambar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "Upload Image",
            style: regulerReguler.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          GestureDetector(
            onTap: () async {
              widget.xfile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.3,
              child: widget.xfile != null
                  ? Image.file(File(widget.xfile!.path))
                  : DottedBorder(
                      dashPattern: const [10, 5],
                      strokeWidth: 1,
                      child: const Center(
                        child: Icon(Icons.add),
                      ),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(routerProvider).pop();
                },
                child: const Text("Back"),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     await ref
              //         .watch(dataUserProvider.notifier)
              //         .uploadImage(imageFile: File(widget.xfile!.path))
              //         .then((String value) {
              //       gambar = value.toString();
              //       setState(() {});
              //       return "error";
              //     });
              //     if (gambar != null) {
              //       ref.read(routerProvider).pop(gambar);
              //     }
              //   },
              //   child: const Text("Upload Image"),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
