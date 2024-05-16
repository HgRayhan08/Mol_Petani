import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class GroupDetailMemberFarmerGroupPage extends ConsumerWidget {
  const GroupDetailMemberFarmerGroupPage(this.user, {super.key});

  final UserFarmer user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueLight,
        title: Text(
          "Detail Anggota Kelompok tani",
          style: regulerReguler,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              bottom: height * 0.02,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: blueLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: extraLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      user.noHp,
                      style: regulerReguler.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              "Data Diri",
              style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(width * 0.03),
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.01,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                _DataInformation(
                  title: "Alamat",
                  information: user.village,
                ),
                _DataInformation(
                  title: "Tanggal Lahir",
                  information: user.dateOfBirth,
                ),
                _DataInformation(
                  title: "Email",
                  information: user.email,
                ),
                _DataInformation(
                  title: "Nomor KK",
                  information: user.kartuKeluarga,
                ),
                _DataInformation(
                  title: "Nomor Induk Keluarga",
                  information: user.nik,
                ),
                _DataInformation(
                  title: "Jenis Kelamin",
                  information: user.jenisKelamin,
                ),
                _DataInformation(
                  title: "Luas Lahan",
                  information: user.luasLahan,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: user.email == ""
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width, height * 0.05)),
                    onPressed: () {
                      ref
                          .read(routerProvider)
                          .pushNamed("create-account-farmer", extra: user);
                    },
                    child: Text(
                      "Create Account",
                      style:
                          buttonReguler.copyWith(fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}

class _DataInformation extends StatelessWidget {
  const _DataInformation({
    required this.title,
    required this.information,
  });

  final String title;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$title : ",
                style: regulerReguler,
              ),
              Text(
                information,
                style: regulerReguler,
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
