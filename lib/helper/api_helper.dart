import 'package:dio/dio.dart';
import 'package:eproperty/helper/logger_helper.dart';

//.
final dio = Dio()
// Configure request options.
  ..options.merge(
    // We use JSON.
    responseType: ResponseType.json,
  )
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options) async {
        // Do something before request is sent.

        return options;
      },
      onResponse: (response) async {
        // Do something with response data.
        return response; // continue
      },
      onError: (error) async {
        // Do something with response error.
        // We print error message;
        logger.e(error);

        return error;
      },
    ),
  );
