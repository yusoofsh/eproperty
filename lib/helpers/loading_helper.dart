import 'package:eproperty/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHelper {
  void configure() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 2)
      ..indicatorType = EasyLoadingIndicatorType.pulse
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 32.0
      ..radius = 16.0
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.black
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.black38;
  }

  void show([String type]) {
    configure();

    if (type == 'success') {
      EasyLoading.showSuccess(CustomStrings.LOG_IN_SUCCESS);
    } else if (type == 'failure') {
      EasyLoading.showError(CustomStrings.LOG_IN_FAILURE);
    } else {
      EasyLoading.show(status: CustomStrings.PLEASE_WAIT);
    }
  }
}
