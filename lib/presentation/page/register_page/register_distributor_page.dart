import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/register_page/method/form_registrasi.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class RegisterDistributorPage extends ConsumerWidget {
  RegisterDistributorPage({super.key});
  final TextEditingController controller = TextEditingController();
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
            formRegistrasi(controler: controller),
          ],
        )
        // Center(
        // child:
        // ElevatedButton(
        //   onPressed: () {
        //     ref.read(dataUserProvider.notifier).registerPetugas(
        //           nama: "distributor pertama",
        //           email: "dispertama@gmail.com",
        //           password: "123456",
        //           keterangan: "distributor",
        //           collection: "user_Distributor",
        //           cangkupan: ["sukoiber", "gudo"],
        //           fotoUrl: "",
        //         );
        //   },
        //   child: const Text("Registrasi"),
        // ),
        // ),
        );
  }
}
