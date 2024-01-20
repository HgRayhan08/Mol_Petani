import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/user_data_petugas/user_data_petugas_provider.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataPetugasProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            if (ref.read(userDataPetugasProvider.notifier).state.value!.uid ==
                "ppl") {}
          }
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
            Text(
              "Monitoring Lahan Petani",
            )
          ],
        ),
      ),
    );
  }
}
