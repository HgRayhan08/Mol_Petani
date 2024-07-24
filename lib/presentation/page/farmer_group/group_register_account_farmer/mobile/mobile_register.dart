import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_register_account_farmer/method/logic_create.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';
import 'package:mol_petani/presentation/widgets/text_field_password_widget.dart';

class MobileRegister extends StatefulWidget {
  final WidgetRef ref;
  final UserFarmer user;
  const MobileRegister(this.ref, {super.key, required this.user});

  @override
  State<MobileRegister> createState() => _MobileRegisterState();
}

class _MobileRegisterState extends State<MobileRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      children: [
        TextFieldCustom(
          hinttext: "Masukan Email",
          controller: emailController,
          title: "Email",
        ),
        TextFieldPasswordWidget(
          hinttext: "Masukan Password",
          controller: passwordController,
          title: "Password",
          iconButton: true,
        ),
        SizedBox(
          height: height * 0.1,
        ),
        ButtonSubmissionWidget(
          onTap: _isLoading ? null : _register,
          title: "Registrasi",
        )
      ],
    );
  }

  void _register() {
    final regsiter = LogicRegister(
        ref: widget.ref,
        context: context,
        emailControler: emailController,
        passwordControler: passwordController,
        user: widget.user);
    regsiter.register((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
  }
}
