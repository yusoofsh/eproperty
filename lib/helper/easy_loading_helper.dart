import 'package:eproperty/value/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingHelper {
  const EasyLoadingHelper();

  void initialize() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.pulse
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 32.0
      ..radius = 16.0
      ..textColor = Colors.black
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.black38;
  }
}
