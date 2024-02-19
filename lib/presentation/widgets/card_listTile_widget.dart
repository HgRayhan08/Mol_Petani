import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class CardListtileWidgets extends StatelessWidget {
  final User user;
  final bool cangkupan;
  final bool trailing;
  final Function() ontap;
  final double rounded;
  const CardListtileWidgets({
    super.key,
    required this.user,
    this.cangkupan = false,
    this.trailing = false,
    required this.ontap,
    this.rounded = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: blueLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(rounded),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: ontap,
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: user.fotoUrl != ""
                  ? NetworkImage(user.fotoUrl.toString()) as ImageProvider
                  : const AssetImage(
                      ("assets/user.png"),
                    ),
            ),
          ),
        ),
        title: Text(
          user.nama,
          style: regulerReguler.copyWith(
              color: light, fontWeight: FontWeight.bold),
        ),
        subtitle: cangkupan == true
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: user.cangkupan!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          user.cangkupan![index],
                          style: smallReguler.copyWith(
                            fontSize: 14,
                            color: dark,
                          ),
                        ),
                      );
                    }),
              )
            : Text(
                user.kelompok!,
                style: smallReguler.copyWith(color: light, fontSize: 16),
              ),
        trailing: trailing == true
            ? const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 30,
              )
            : const SizedBox(),
      ),
    );
  }
}
