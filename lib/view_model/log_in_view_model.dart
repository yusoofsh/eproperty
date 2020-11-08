import 'dart:convert';

import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/repository/token_repository.dart';

class LogInViewModel with ActionMixin {
  final repository = TokenRepository();

  Future<void> requestAuthentication(Map<String, dynamic> credential) async {
    callback(const Loading());

    final String authentication = 'Basic ${base64Encode(
      utf8.encode('${credential['email']}:${credential['password']}'),
    )}';

    await repository
        .request(authentication)
        .then((value) => storeResponse(value))
        .catchError((error) => callback(Failure(error: error)));
  }

  Future<void> storeResponse(String token) async {
    callback(const Loading());

    await repository
        .store('put', token: token)
        .then((_) => callback(const Success()));
  }

  void forgotCredential() {}
}
