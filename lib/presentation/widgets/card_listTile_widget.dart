import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class CardListtileWidgets extends StatelessWidget {
  final User user;
  final bool cangkupan;
  const CardListtileWidgets({
    super.key,
    required this.user,
    this.cangkupan = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: blueLight,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        // contentPadding: const EdgeInsets.all(0),
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

            // ? Text(user.cangkupan![1])
            : Text(
                user.kelompok!,
                style: smallReguler.copyWith(color: light, fontSize: 16),
              ),
      ),
    );
  }
}
