import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class PplSubmissionGroupPage extends ConsumerWidget {
  final UserFarmerGroup userGroup;
  const PplSubmissionGroupPage(this.userGroup, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(userGroup.farmerGrup),
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getSubmissionFarmerGroup(idGroupFarmer: userGroup.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.only(top: height * 0.01),
                  leading: Text(
                    data[index].forYear,
                    style: largeReguler.copyWith(fontWeight: FontWeight.bold),
                  ),
                  title: Text(data[index].leaderName, style: largeReguler),
                  subtitle: Text(data[index].date, style: regulerReguler),
                  shape: const Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    ref.read(routerProvider).goNamed(
                          "detail-submission-fertilizer",
                          extra: data[index],
                        );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
