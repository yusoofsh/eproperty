import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHelper {
  void initialize() {
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

  void show(
    String message, {
    String type,
  }) {
    if (type == 'success') {
      EasyLoading.showSuccess(message);
    } else if (type == 'failure') {
      EasyLoading.showError(message);
    } else {
      EasyLoading.show(status: message);
    }
  }
}
