import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class GroupRegisterAccountFarmerPage extends ConsumerWidget {
  final UserFarmer user;
  const GroupRegisterAccountFarmerPage(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Account",
          style: regulerReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        children: [
          TextFieldCustom(
            hinttext: "Masukan Email",
            controller: emailController,
            title: "Email",
          ),
          TextFieldCustom(
            hinttext: "Masukan Password",
            controller: passwordController,
            title: "Password",
          ),
          SizedBox(
            height: height * 0.08,
          ),
          ElevatedButton(
              onPressed: () {
                // if (emailController.text == "" ||
                //     passwordController.text == "") {
                //   print("belum di isi");
                // } else {
                ref.read(dataUserProvider.notifier).updateAccountFarmer(
                    email: emailController.text,
                    password: passwordController.text,
                    idDocument: user.idDocument!);
                // }
              },
              child: Text(
                "Registrasi",
                style: buttonReguler,
              ))
        ],
      ),
    );
  }
}
