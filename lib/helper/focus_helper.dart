import 'package:flutter/widgets.dart';

class FocusHelper {
  FocusHelper(this.context) {
    currentFocus = FocusScope.of(context);
  }

  final BuildContext context;

  FocusScopeNode currentFocus;

  void unfocus() {
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
