import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class GroupAcceptedFertilizerFarmerPage extends ConsumerWidget {
  final UserFarmer user;
  const GroupAcceptedFertilizerFarmerPage(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Distribusi Pupuk", style: largeReguler),
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getSendFertilizerFarmer(idFarmer: user.idUserFarmer),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.01),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      ref.read(routerProvider).pushNamed(
                          "detail-distribution-fertilizer-farmer",
                          extra: data[index]);
                    },
                    leading: Text(
                      data[index].year,
                      style: regulerReguler,
                    ),
                    title: Text(data[index].farmerName),
                    subtitle: Text(data[index].distribusiDate),
                    trailing: Text(data[index].information),
                  ),
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
      floatingActionButton: IconButton(
        onPressed: () {
          ref
              .read(routerProvider)
              .pushNamed("form_distribution-farmer", extra: user);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
