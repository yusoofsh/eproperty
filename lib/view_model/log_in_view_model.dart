import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LogInState {
  failure,
  loading,
  success,
}

class LogInViewModel extends ChangeNotifier {
  final userRepository = UserRepository();

  LogInState state = LogInState.loading;

  String message;

  Future<void> requestAuthentication(Map<String, dynamic> credential) async {
    final token = 'Basic ${base64Encode(
      utf8.encode('${credential['email']}:${credential['password']}'),
    )}';

    try {
      final _response = await userRepository.requestLogIn(token);

      final _data = {
        'api_key': _response.user.apiKey,
        'api_url': _response.user.apiUrl,
        'email': _response.user.email,
        'image': _response.user.image,
        'is_logged_in': true,
        'name': _response.user.name,
        'token': _response.token,
      };

      await storeResponse(_data);
    } on DioError catch (error) {
      message = error.response.data['message'] as String;

      state = LogInState.failure;

      notifyListeners();
    }
  }

  Future<void> storeResponse(Map<String, dynamic> data) async {
    try {
      await userRepository.storeData(data: data);

      state = LogInState.success;

      notifyListeners();
    } catch (error) {
      message = error as String;
      state = LogInState.failure;

      notifyListeners();
    }
  }
}

final logInViewModelProvider = ChangeNotifierProvider(
  (_) => LogInViewModel(),
);
