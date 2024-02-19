import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/page/data_submission_grup_farmer_page/method/data_completed_submission_grup.dart';
import 'package:mol_petani/presentation/page/data_submission_grup_farmer_page/method/data_process_submission_grup.dart';

class DataSubmissionGrupFarmerPage extends StatelessWidget {
  const DataSubmissionGrupFarmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text("Proses"),
              ),
              Tab(
                icon: Text("Selesai"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DataProcessSubmissionGrup(),
            DataCompletedSubmissionGrup(),
          ],
        ),
      ),
    );
  }
}
