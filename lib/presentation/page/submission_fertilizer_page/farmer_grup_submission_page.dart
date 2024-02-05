import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class FarmerGrupFertilizerPage extends ConsumerWidget {
  const FarmerGrupFertilizerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(dataUserProvider.notifier).createPengajuanPupuk(
                  idKelompoktani: "vV2QBBtTSZdkYN4byngCy1svzVz2",
                  namaKetua: "kelompok Sukoiber",
                  desa: "sukoiber",
                  forYear: "2025",
                  tanggal: "24-01-2024",
                  petaniPupuk: null,
                );
          },
          child: const Text("create"),
        ),
      ),
    );
  }
}
