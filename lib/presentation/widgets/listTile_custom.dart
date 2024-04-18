import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class ListTileCustom extends StatelessWidget {
  // final Map<String, dynamic> data;
  final String image;
  final bool scope;
  final String title;
  final String? subtitle;
  final List? subscope;
  final Function() onTap;

  const ListTileCustom(
      {Key? key,
      this.scope = false,
      required this.title,
      this.subtitle,
      this.subscope,
      required this.onTap,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.006),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: dark,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: dark,
              blurRadius: 5,
              offset: Offset(1, 2), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.16,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
            Container(
              // color: Colors.blue,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                  ),
                  scope == true
                      ? Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.035,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: subscope!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    margin: const EdgeInsets.only(right: 6),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: const BoxDecoration(
                                      color: dark,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        subscope![index],
                                        style: smallReguler.copyWith(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      : Text(
                          subtitle!,
                          style:
                              smallReguler.copyWith(color: dark, fontSize: 16),
                        ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 40,
              ),
            ),
          ],
        ),
        // child: ListTile(
        //   minVerticalPadding: 10,
        //   contentPadding: const EdgeInsets.all(10),
        //   horizontalTitleGap: 0,
        //   minLeadingWidth: 0,
        //   leading: Container(
        //     width: MediaQuery.of(context).size.width * 0.2,
        //     height: MediaQuery.of(context).size.height * 0.2,
        //     decoration: BoxDecoration(
        //         color: Colors.amber,
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(100),
        //         )),
        //   ),
        //   title: Text(title),
        //   subtitle: scope == true
        //       ? SizedBox(
        //           height: MediaQuery.of(context).size.height * 0.035,
        //           child: ListView.builder(
        //               scrollDirection: Axis.horizontal,
        //               itemCount: subscope!.length,
        //               itemBuilder: (context, index) {
        //                 return Container(
        //                   width: MediaQuery.of(context).size.width * 0.2,
        //                   margin: const EdgeInsets.only(right: 6),
        //                   padding: const EdgeInsets.symmetric(
        //                       vertical: 5, horizontal: 10),
        //                   decoration: const BoxDecoration(
        //                     color: dark,
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(100),
        //                     ),
        //                   ),
        //                   child: Center(
        //                     child: Text(
        //                       subscope![index],
        //                       style: smallReguler.copyWith(
        //                         fontSize: 14,
        //                         color: Colors.white,
        //                       ),
        //                     ),
        //                   ),
        //                 );
        //               }),
        //         )
        //       : Text(
        //           subtitle!,
        //           style: smallReguler.copyWith(color: dark, fontSize: 16),
        //         ),
        //   trailing: const Icon(
        //     Icons.keyboard_arrow_right_outlined,
        //     size: 40,
        //   ),
        // ),
      ),
    );
  }
}
