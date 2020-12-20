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

  Future<void> authentication(Map<String, dynamic> credential) async {
    final token = 'Basic ${base64Encode(
      utf8.encode('${credential['email']}:${credential['password']}'),
    )}';

    try {
      final _response = await userRepository.logIn(token);

      final _data = {
        'is_logged_in': true,
        'token': _response.token,
        'api_key': _response.user.apiKey,
        'api_url': _response.user.apiUrl,
        'name': _response.user.name,
        'email': _response.user.email,
        'image': _response.user.image,
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
      await userRepository.storeData(entries: data);

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
