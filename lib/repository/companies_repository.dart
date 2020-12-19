import 'package:eproperty/helper/dio_helper.dart';
import 'package:eproperty/helper/hive_helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/service/rest_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class CompaniesRepository {
  final rest = RestService(dio);

  Future<CompaniesModel> companiesActive(
    String token,
  ) async {
    final _response = await rest.companiesActive(token);

    return _response;
  }

  Future<CompaniesModel> companiesChild(
    int id,
    String token,
  ) async {
    final _response = await rest.companiesChild(id, token);

    return _response;
  }

  Future<Box> companiesBox() async {
    final _database = HiveHelper();

    final _key = await _database.keyBox();

    final _box = await _database.open(
      'companies',
      key: _key,
    );

    return _box;
  }

  Future<void> storeData({
    @required Map<String, dynamic> data,
  }) async {
    final _box = await companiesBox();

    await _box.putAll(data);
  }

  Future<T> retrieveData<T>({
    @required String name,
    dynamic value,
  }) async {
    final _box = await companiesBox();

    final _data = _box.get(
      name,
      defaultValue: value,
    ) as T;

    return _data;
  }
}
