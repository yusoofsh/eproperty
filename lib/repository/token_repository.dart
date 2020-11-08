import 'dart:io';
import 'dart:typed_data';

import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/service/api_service.dart';

class TokenRepository {
  Future<dynamic> request(String authentication) async {
    dynamic payload;

    dio.options.headers[HttpHeaders.authorizationHeader] = authentication;

    await ApiService(dio)
        .authToken()
        .then((value) => payload = value.token)
        .catchError((error) => payload = error);

    return payload;
  }

  Future<dynamic> store(String type, {String token}) async {
    final DatabaseHelper _helper = DatabaseHelper();

    final _mainBox = await _helper.openBox('main');
    if (!_helper.containsKey(_mainBox, 'key')) {
      _mainBox.put('key', _helper.generateSecureKey());
    }

    final _key = _mainBox.get('key') as Uint8List;
    final _encryptedBox = await _helper.openBox(
      'encrypted',
      key: _key,
    );

    if (type == 'get') {
      return _encryptedBox.get('token');
    } else if (type == 'put') {
      await _encryptedBox.put('token', token);
    }
  }
}
