import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      dataUserProvider,
      (previous, next) {
        // print(next.value!.length);
        if (next is AsyncData) {
          Future.delayed(
            const Duration(milliseconds: 1500),
            () {
              if (next.value != null) {
                if (next.value!["information"] ==
                    "Penyuluh Pertanian Lapangan") {
                  ref.read(routerProvider).goNamed("main-ppl");
                } else if (next.value!["information"] == "Distributor") {
                  ref.read(routerProvider).goNamed("main-dist");
                } else if (next.value!["information"] == "Kelompok Tani") {
                  ref.read(routerProvider).goNamed("main-kelompok");
                } else if (next.value!["information"] == "Petani") {
                  ref.read(routerProvider).goNamed("main-farmer");
                }
              } else {
                ref.read(routerProvider).goNamed("user-login");
              }
            },
          );
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.asError!.error.toString()),
            ),
          );
          //   } else {
          //     ref.read(routerProvider).goNamed("login-petani");
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              fit: BoxFit.cover,
            ),
            Text(
              "Monitoring Lahan Petani",
              style: extraLarge.copyWith(
                color: dark,
                fontWeight: FontWeight.bold,
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       ref.read(dataUserProvider.notifier).logoutPetugas();
            //     },
            //     child: Text("sas"))
          ],
        ),
      ),
    );
  }
}
