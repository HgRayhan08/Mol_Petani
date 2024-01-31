import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/register_page/method/form_registrasi.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class RegisterKelompokPage extends ConsumerWidget {
  final TextEditingController emailControler = TextEditingController();
  RegisterKelompokPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => ref.read(routerProvider).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          formRegistrasi(controler: emailControler),
          ElevatedButton(
            onPressed: () {
              ref.read(dataUserProvider.notifier).registerGrupFarmer(
                    nama: "kelompok Sukoiber",
                    email: "kelompoktan4@gmail.com",
                    password: "123456",
                    kelompok: "sukoiber",
                    fotoUrl: "",
                    desa: "Sukoiber",
                  );
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
