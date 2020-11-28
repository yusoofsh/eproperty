import 'dart:convert';

import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/repository/user_repository.dart';

class LogInViewModel with ActionMixin {
  final repository = UserRepository();

  Future<void> requestAuthentication(Map<String, dynamic> credential) async {
    callback(const Loading());

    final token = 'Basic ${base64Encode(
      utf8.encode('${credential['email']}:${credential['password']}'),
    )}';

    await repository.requestLogIn(token).then((value) {
      storeResponse({
        'api_key': value.user.apiKey,
        'api_url': value.user.apiUrl,
        'email': value.user.email,
        'image': value.user.image,
        'is_logged_in': true,
        'name': value.user.name,
        'token': value.token,
      });
    }).catchError((error) {
      callback(Failure(error: error));
    });
  }

  Future<void> storeResponse(Map<String, dynamic> data) async {
    await repository.storeData(data: data).whenComplete(() {
      callback(const Success());
    });
  }
}
