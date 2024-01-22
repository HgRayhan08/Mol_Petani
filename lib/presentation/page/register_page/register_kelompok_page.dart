import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/user_data_petugas/data_user_petugas_provider.dart';

class RegisterKelompokPage extends ConsumerWidget {
  const RegisterKelompokPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(dataUserPetugasProvider.notifier).registerPetugas(
                  nama: "kelompok Sukoiber",
                  email: "kelompoktani@gmail.com",
                  password: "123456",
                  keterangan: "Kelompok Tani",
                  collection: "user_kelompok_tani",
                  kelompok: "sukoiber",
                  fotoUrl: "",
                );
          },
          child: const Text("Register"),
        ),
      ),
    );
  }
}
