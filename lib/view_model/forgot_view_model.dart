import 'package:dio/dio.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/repository/forgot_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ForgotState {
  initial,
  loading,
  dismiss,
  failure,
  success,
}

class ForgotViewModel extends StateNotifier<ForgotState> {
  ForgotViewModel() : super(ForgotState.initial);

  final forgotRepository = ForgotRepository();
  final databaseHelper = DatabaseHelper();

  bool enableNextInput = false;

  String message;

  Future<void> requestCode(
    Map<String, String> value,
  ) async {
    state = ForgotState.loading;

    try {
      await forgotRepository.requestForgot(value);

      enableNextInput = true;

      state = ForgotState.dismiss;

      state = ForgotState.initial;
    } on DioError catch (error) {
      message = error.response.data['message'] as String;

      state = ForgotState.failure;
    }
  }

  Future<void> requestReset(
    Map<String, dynamic> value,
  ) async {
    state = ForgotState.loading;

    try {
      await forgotRepository.requestReset(value);

      state = ForgotState.success;
    } on DioError catch (error) {
      message = error.response.data;

      state = ForgotState.failure;
    }
  }
}
