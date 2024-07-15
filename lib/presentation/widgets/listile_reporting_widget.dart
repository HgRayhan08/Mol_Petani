import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class ListTileReportingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final Function() onTap;
  const ListTileReportingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Material(
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          title: Text(
            title,
            style: regulerReguler,
          ),
          subtitle: Text(
            subtitle,
            style: regulerReguler,
          ),
          trailing: Text(
            trailing,
            style: regulerReguler.copyWith(fontSize: 14),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
