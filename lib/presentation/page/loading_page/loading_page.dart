import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data_petugas/data_user_petugas_provider.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      dataUserPetugasProvider,
      (previous, next) {
        if (next is AsyncData) {
          Future.delayed(
            const Duration(milliseconds: 1500),
            () {
              if (next.value != null) {
                if (ref
                        .read(dataUserPetugasProvider.notifier)
                        .state
                        .value!
                        .keterangan ==
                    "Penyuluh Pertanian Lapangan") {
                  ref.read(routerProvider).goNamed("main-ppl");
                } else if (ref
                        .read(dataUserPetugasProvider.notifier)
                        .state
                        .value!
                        .keterangan ==
                    "distributor") {
                  ref.read(routerProvider).goNamed("main-dist");
                } else if (ref
                        .read(dataUserPetugasProvider.notifier)
                        .state
                        .value!
                        .keterangan ==
                    "Kelompok Tani") {
                  ref.read(routerProvider).goNamed("main-kelompok");
                }
              } else {
                ref.read(routerProvider).goNamed("login-petani");
              }
            },
          );
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error poll"),
            ),
          );
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
              width: 300,
              height: 80,
              fit: BoxFit.cover,
            ),
            const Text(
              "Monitoring Lahan Petani",
            ),
          ],
        ),
      ),
    );
  }
}
