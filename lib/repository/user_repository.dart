import 'package:eproperty/helper/dio_helper.dart';
import 'package:eproperty/helper/hive_helper.dart';
import 'package:eproperty/model/user_model.dart';
import 'package:eproperty/service/rest_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class UserRepository {
  final rest = RestService(dio);

  Future<UserModel> logIn(String token) async {
    final _response = await rest.authToken(token);

    return _response;
  }

  Future<Box> userBox() async {
    final _database = HiveHelper();

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

  Future<T> retrieveData<T>({
    @required String name,
    dynamic value,
  }) async {
    final _box = await userBox();

    final _data = _box.get(
      name,
      defaultValue: value,
    ) as T;

    return _data;
  }
}
