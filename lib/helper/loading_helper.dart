import 'package:eproperty/value/value.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHelper {
  void initialize() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.pulse
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 32.0
      ..radius = 16.0
      ..backgroundColor = Colors.green
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

  void dismiss() {
    EasyLoading.dismiss();
  }
}
