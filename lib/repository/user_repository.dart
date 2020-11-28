import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/user_model.dart';
import 'package:eproperty/service/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class UserRepository {
  final api = ApiService(dio);

  Future<UserModel> requestLogIn(String token) async {
    final _response = await api.authToken(token);

    return _response;
  }

  Future<Box> userBox() async {
    final _database = DatabaseHelper();

    final _key = await _database.keyBox();

    final _box = await _database.open(
      'user',
      key: _key,
    );

    return _box;
  }

  Future<void> storeData({
    @required Map<String, dynamic> data,
  }) async {
    final _box = await userBox();

    await _box.putAll(data);
  }

  Future<dynamic> retrieveData({
    @required String name,
    dynamic value,
  }) async {
    final _box = await userBox();

    final _data = _box.get(
      name,
      defaultValue: value,
    );

    return _data;
  }
}
