import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends ConsumerWidget {
  final Widget Function(BuildContext, WidgetRef) androidBuilder;
  final Widget Function(BuildContext, WidgetRef) iosBuilder;
  final Widget Function(BuildContext, WidgetRef) webBuilder;
  const PlatformWidget({
    required this.androidBuilder,
    required this.iosBuilder,
    required this.webBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context, ref);
      case TargetPlatform.iOS:
        return iosBuilder(context, ref);
      default:
        return webBuilder(context, ref);
    }
  }
}
