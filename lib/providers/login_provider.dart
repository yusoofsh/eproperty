import 'dart:convert';

import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helpers/helpers.dart';
import 'package:eproperty/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = ChangeNotifierProvider((_) => LoginProvider());

class LoginProvider extends ChangeNotifier with ActionMixin {
  void parseCredential(Map<String, dynamic> credential) {
    final String authentication = 'Basic ${base64Encode(
      utf8.encode('${credential['email']}:${credential['password']}'),
    )}';

    TokenRepository().request(authentication).then(
      (success) {
        callback(LoadingEvent());

        if (success) {
          callback(SuccessEvent());
        } else {
          callback(FailureEvent());
        }
      },
    );
  }
}
