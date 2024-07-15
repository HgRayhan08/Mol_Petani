import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget menuDistributor(ref, width, height, {required Function() onTapLogout}) =>
    Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.05),
      child: Column(
        children: [
          Material(
            child: ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                backgroundColor: dark,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text("My Detail User",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          Material(
            child: ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                backgroundColor: dark,
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
              title: Text("Information",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          Material(
            child: ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                backgroundColor: dark,
                child: Icon(
                  Icons.privacy_tip,
                  color: Colors.white,
                ),
              ),
              title: Text("Privacy",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          Material(
            child: ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                backgroundColor: dark,
                child: Icon(
                  Icons.security,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "Security",
                style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Material(
            child: ListTile(
              onTap: onTapLogout,
              leading: const CircleAvatar(
                backgroundColor: dark,
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "logout",
                style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
