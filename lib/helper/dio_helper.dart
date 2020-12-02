import 'package:dio/dio.dart';
import 'package:eproperty/helper/logger_helper.dart';

final dio = Dio()
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options) async {
        // Do something before request is sent.
        options.merge(
          connectTimeout: 5000,
          receiveTimeout: 3000,
        );

        // Continue.
        return options;
      },
      onError: (error) {
        // Do something with response error.
        // We print error message;
        logger.e(error);

        // Continue.
        return error;
      },
    ),
  );
