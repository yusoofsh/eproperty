import 'package:dio/dio.dart';
import 'package:eproperty/helper/hive_helper.dart';
import 'package:eproperty/repository/forgot_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ForgotState {
  failure,
  loading,
  next,
  success,
}

class ForgotViewModel extends ChangeNotifier {
  final forgotRepository = ForgotRepository();
  final databaseHelper = HiveHelper();

  ForgotState state = ForgotState.loading;

  String message;

  Future<void> requestCode(
    Map<String, String> value,
  ) async {
    try {
      await forgotRepository.requestForgot(value);

      state = ForgotState.next;

      notifyListeners();
    } on DioError catch (error) {
      message = error.response.data['message'] as String;

      state = ForgotState.failure;

      notifyListeners();
    }
  }

  Future<void> requestReset(
    Map<String, dynamic> value,
  ) async {
    try {
      await forgotRepository.requestReset(value);

      state = ForgotState.success;

      notifyListeners();
    } on DioError catch (error) {
      message = error.response.data['message'] as String;

      state = ForgotState.failure;

      notifyListeners();
    }
  }
}

final forgotViewModelProvider = ChangeNotifierProvider(
  (_) => ForgotViewModel(),
);
