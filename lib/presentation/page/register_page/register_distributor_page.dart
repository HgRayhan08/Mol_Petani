import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/user_data_petugas/data_user_petugas_provider.dart';

class RegisterDistributorPage extends ConsumerWidget {
  const RegisterDistributorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(dataUserPetugasProvider.notifier).registerPetugas(
                  nama: "distributor pertama",
                  email: "dispertama@gmail.com",
                  password: "123456",
                  keterangan: "distributor",
                  collection: "user_Distributor",
                  cangkupan: ["sukoiber", "gudo"],
                  fotoUrl: "",
                );
          },
          child: const Text("Registrasi"),
        ),
      ),
    );
  }
}
