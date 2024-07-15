import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/provider/weather/weather_provider.dart';
import 'package:mol_petani/presentation/widgets/news_widget.dart';

class MobileHomeFarmer extends StatelessWidget {
  final WidgetRef ref;
  const MobileHomeFarmer({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05, top: height * 0.01),
      children: [
        defaultTargetPlatform == TargetPlatform.iOS
            ? Text(
                "Hi ${ref.read(dataUserProvider).value!["name"]}",
                style: extraLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )
            : Container(),
        SizedBox(height: height * 0.02),
        FutureBuilder(
          future: ref
              .watch(weatherProviderProvider.notifier)
              .getWeatherData(context),
          builder: (context, positions) {
            if (positions.hasData) {
              var data = positions.data!.resultValue!;
              return Container(
                height: height * 0.2,
                padding: EdgeInsets.symmetric(horizontal: height * 0.05),
                decoration: const BoxDecoration(
                  color: blueLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://openweathermap.org/img/wn/${data.data[0].weather[0].icon}@2x.png"),
                      width: 120,
                    ),
                    Text(data.data[0].weather[0].description),
                    SizedBox(height: height * 0.01),
                    Text(data.timezone)
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        SizedBox(
          height: height * 0.7,
          child: const NewsWidget(
            amounnt: 4,
          ),
        ),
      ],
    );
  }
}
