import 'dart:convert';

import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/repository/user_repository.dart';

class LogInViewModel with ActionMixin {
  final repository = UserRepository();

  Future<void> requestAuthentication(Map<String, dynamic> credential) async {
    callback(const Loading());

    final authentication = 'Basic ${base64Encode(
      utf8.encode('${credential['email']}:${credential['password']}'),
    )}';

    await repository
        .request(authentication)
        .then((value) => storeResponse(value))
        .catchError((error) => callback(Failure(error: error)));
  }

  Future<void> storeResponse(Map<String, dynamic> data) async {
    callback(const Loading());

    await repository
        .store('put', data: data)
        .then((_) => callback(const Success()));
  }

  void goToForgot() {
    callback(const Forgot());
  }
}
