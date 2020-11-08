import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHelper {
  LoadingHelper() {
    initialize();
  }

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
    const Duration _duration = Duration(seconds: 4);

    if (type == 'success') {
      EasyLoading.showSuccess(message, duration: _duration);
    } else if (type == 'failure') {
      EasyLoading.showError(message, duration: _duration);
    } else {
      EasyLoading.show(status: message);
    }
  }
}
