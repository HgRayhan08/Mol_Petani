import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class MobileSubmissionGroup extends StatelessWidget {
  final WidgetRef ref;
  final UserFarmerGroup userGroup;
  const MobileSubmissionGroup({
    super.key,
    required this.ref,
    required this.userGroup,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
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
              return Material(
                child: ListTile(
                  tileColor: background,
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
                      // extra: data[index],
                      extra: {
                        'data': data[index],
                        'user': userGroup,
                      },
                    );
                  },
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
    );
  }
}
