import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:eproperty/helpers/helpers.dart';
import 'package:eproperty/services/services.dart';

class TokenRepository {
  Future<bool> request(String authentication) async {
    dio.options.headers[HttpHeaders.authorizationHeader] = authentication;

    try {
      await ApiService(dio).authToken().then(
        (model) {
          store(model.token);
        },
      );

      return true;
    } on DioError catch (error) {
      // Non-200 error goes here.
      final response = error.response;
      logger.e(
        'Got error : ${response.statusCode} -> ${response.statusMessage}',
      );
    }

    return false;
  }

  Future<void> store(String token) async {
    final HiveHelper _helper = getIt<HiveHelper>();

    _helper.init();

    final _mainBox = await _helper.open('main');
    if (!_helper.contains(_mainBox, 'secure')) {
      final _key = _helper.generate();
      _mainBox.put('secure', _key);
    }

    final _key = _mainBox.get('key') as Uint8List;
    final _encryptedBox = await _helper.open(
      'encrypted',
      key: _key,
    );

    _encryptedBox.put('token', token);
  }
}
