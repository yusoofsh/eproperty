import 'package:dio/dio.dart';
import 'package:eproperty/helper/logger_helper.dart';

final dio = Dio()
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options) async {
        // Do something before request is sent.
        options.connectTimeout = 5000;
        options.receiveTimeout = 3000;

        // Continue.
        return options;
      },
      onError: (error) {
        // Do something with response error.
        // We print error message;
        final baseUrl = error.request.baseUrl;
        final path = error.request.path;
        final statusCode = error.response.statusCode;
        final data = error.response.data;

        logger.e('$baseUrl$path\n$statusCode\n$data');
        // Continue.
        return error;
      },
    ),
  );
