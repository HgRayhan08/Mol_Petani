import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget menuDistributor(ref, width, height, {required Function() onTapLogout}) =>
    Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.05),
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text("My Detail User", style: regulerReguler),
          ),
          ListTile(
            onTap: () {},
            leading: const CircleAvatar(
              child: Icon(Icons.info),
            ),
            title: Text("Information", style: regulerReguler),
          ),
          ListTile(
            onTap: () {},
            leading: const CircleAvatar(
              child: Icon(Icons.privacy_tip),
            ),
            title: Text("Privacy", style: regulerReguler),
          ),
          ListTile(
            onTap: () {},
            leading: const CircleAvatar(
              child: Icon(Icons.security),
            ),
            title: Text("Security", style: regulerReguler),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          ListTile(
            onTap: onTapLogout,
            leading: const CircleAvatar(
              backgroundColor: blueLight,
              child: Icon(Icons.logout),
            ),
            title: Text("logout", style: regulerReguler),
          )
        ],
      ),
    );
