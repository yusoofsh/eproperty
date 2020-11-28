import 'dart:typed_data';

import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/service/api_service.dart';

class UserRepository {
  dynamic payload;

  Future<dynamic> request(String authentication) async {
    await ApiService(dio)
        .authToken(authentication)
        .then((response) => payload = {
              'is_logged_in': true,
              'token': response.token,
              'name': response.user.name,
              'email': response.user.email,
              'image': response.user.image,
              'api_url': response.user.apiUrl,
              'api_key': response.user.apiKey,
            })
        .catchError((error) => payload = error);

    return payload;
  }

  Future<dynamic> store(
    String type, {
    String name,
    dynamic defaultValue,
    Map<String, dynamic> data,
  }) async {
    final _helper = DatabaseHelper();

    final _secureBox = await _helper.open('secure');
    if (!_helper.containsKey(_secureBox, 'key')) {
      await _secureBox.put('key', _helper.generateSecureKey());
    }

    final _key = _secureBox.get('key') as Uint8List;
    final _userBox = await _helper.open(
      'user',
      key: _key,
    );

    if (type == 'get') {
      assert(
        name != null,
        'Fill the optional "name" parameter!',
      );

      return _userBox.get(
        name,
        defaultValue: defaultValue,
      );
    } else if (type == 'put') {
      assert(
      data != null,
      'Fill the optional "data" parameter!',
      );

      await _userBox.putAll(data);
    }
  }
}
