import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class PplProfilePage extends ConsumerStatefulWidget {
  const PplProfilePage({
    super.key,
  });

  @override
  ConsumerState<PplProfilePage> createState() => _PplProfilePageState();
}

class _PplProfilePageState extends ConsumerState<PplProfilePage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      dataUserProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).goNamed("login-petani");
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error.toString()),
            ),
          );
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Halaman main"),
            ElevatedButton(
              onPressed: () {
                ref.read(dataUserProvider.notifier).logoutPetugas();
              },
              child: const Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
