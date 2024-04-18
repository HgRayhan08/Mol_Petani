import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class ProcessSubmissionWidget extends StatefulWidget {
  final int submission;
  const ProcessSubmissionWidget({super.key, required this.submission});

  @override
  State<ProcessSubmissionWidget> createState() =>
      _ProcessSubmissionWidgetState();
}

class _ProcessSubmissionWidgetState extends State<ProcessSubmissionWidget> {
  bool firstSubmission = false;
  bool secoundSubmission = false;
  bool threadSubmission = false;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        if (widget.submission == 1) {
          firstSubmission = true;
        } else if (widget.submission == 2) {
          firstSubmission = true;
          secoundSubmission = true;
        } else if (widget.submission == 3) {
          firstSubmission = true;
          secoundSubmission = true;
          threadSubmission = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const Divider(
              height: 15,
              thickness: 2,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: firstSubmission == true ? greenLeaf : Colors.grey,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: firstSubmission == true
                        ? const Icon(Icons.check)
                        : Container(),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          secoundSubmission == true ? greenLeaf : Colors.grey,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: secoundSubmission == true
                        ? const Icon(Icons.check)
                        : Container(),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: threadSubmission == true ? greenLeaf : Colors.grey,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: threadSubmission == true
                        ? const Icon(Icons.check)
                        : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pengajuan 1",
                style: smallReguler.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "Pengajuan 2",
                style: smallReguler.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "Pengajuan 3",
                style: smallReguler.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
