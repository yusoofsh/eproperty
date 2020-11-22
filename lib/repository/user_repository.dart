import 'dart:io';
import 'dart:typed_data';

import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/service/api_service.dart';

class UserRepository {
  dynamic payload;

  Future<dynamic> request(String authentication) async {
    dio.options.headers[HttpHeaders.authorizationHeader] = authentication;

    await ApiService(dio)
        .authToken()
        .then(
          (response) => payload = {
            'token': response.token,
            'name': response.user.name,
            'email': response.user.email,
            'image': response.user.image,
            'apiUrl': response.user.apiUrl,
            'apiKey': response.user.apiKey,
          },
        )
        .catchError((error) => payload = error);

    return payload;
  }

  Future<dynamic> store(String type, {Map<String, dynamic> data}) async {
    final _helper = DatabaseHelper();

    final _secureBox = await _helper.openBox('secure');
    if (!_helper.containsKey(_secureBox, 'key')) {
      await _secureBox.put('key', _helper.generateSecureKey());
    }

    final _key = _secureBox.get('key') as Uint8List;
    final _userBox = await _helper.openBox(
      'user',
      key: _key,
    );

    if (type == 'get') {
      return _userBox.get('token');
    } else if (type == 'put') {
      await _userBox.putAll(data);
    }
  }
}
