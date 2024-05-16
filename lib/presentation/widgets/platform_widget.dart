import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;
  final WidgetBuilder webBuilder;
  const PlatformWidget({
    required this.androidBuilder,
    required this.iosBuilder,
    required this.webBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        return webBuilder(context);
    }
  }
}
