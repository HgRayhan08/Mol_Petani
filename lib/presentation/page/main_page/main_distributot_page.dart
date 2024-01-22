import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data_petugas/data_user_petugas_provider.dart';

class MainDistributorPage extends ConsumerWidget {
  const MainDistributorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(dataUserPetugasProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed("login-ppl");
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
          ),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("distributor"),
            ElevatedButton(
              onPressed: () {
                ref.read(dataUserPetugasProvider.notifier).logoutPetugas();
              },
              child: const Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
