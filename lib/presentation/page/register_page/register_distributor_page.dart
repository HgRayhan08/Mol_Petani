import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/register_page/method/form_register_distributor.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/card_coverage_widget.dart';

class RegisterDistributorPage extends ConsumerStatefulWidget {
  RegisterDistributorPage({super.key});
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController subdistrikControler = TextEditingController();
  final TextEditingController coverageControler = TextEditingController();
  @override
  ConsumerState<RegisterDistributorPage> createState() =>
      _RegisterDistributorPageState();
}

class _RegisterDistributorPageState
    extends ConsumerState<RegisterDistributorPage> {
  List<String> coverage = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Distributor",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Input Data Distributor",
                    style: largeReguler.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            formRegisterDistributor(
              context,
              emailcontroler: widget.emailControler,
              passwordcontroler: widget.passwordControler,
              namecontroler: widget.nameControler,
              subdistrikControler: widget.subdistrikControler,
              cangkupanControler: widget.coverageControler,
              addList: () {
                if (widget.coverageControler.text != "") {
                  coverage.add(widget.coverageControler.text);
                  widget.coverageControler.clear();
                  setState(() {});
                } else {}
              },
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coverage.length,
                itemBuilder: (context, index) {
                  return CardCoverageWidget(
                    title: coverage[index],
                    ontap: () {
                      setState(() {
                        coverage.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.emailControler.text == "" ||
                    widget.passwordControler.text == "" ||
                    widget.nameControler.text == "" ||
                    widget.subdistrikControler.text == "" ||
                    coverage == []) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text("Please enter the data completely"),
                    ),
                  );
                } else {
                  ref.read(dataUserProvider.notifier).registerDistributor(
                        nama: widget.nameControler.text,
                        email: widget.emailControler.text,
                        password: widget.passwordControler.text,
                        cangkupan: coverage,
                        subDistrik: widget.subdistrikControler.text,
                      );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: light,
                      duration: const Duration(seconds: 4),
                      content: Text(
                        "Create Account is Succes",
                        style: regulerReguler.copyWith(
                          color: dark,
                        ),
                      ),
                    ),
                  );
                  Future.delayed(
                    const Duration(seconds: 5),
                    () {
                      ref.read(routerProvider).pop();
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                backgroundColor: const Color(0xff7BD3EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Register",
                style: buttonReguler.copyWith(color: light),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
