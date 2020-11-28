import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/service/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class CompaniesRepository {
  final api = ApiService(dio);

  Future<CompaniesModel> requestCompaniesActive(
    String token,
  ) async {
    final _response = await api.companiesActive(token);

    return _response;
  }

  Future<CompaniesModel> requestCompaniesChild(
    int id,
    String token,
  ) async {
    final _response = await api.companiesChild(id, token);

    return _response;
  }

  Future<CompaniesModel> requestSalesReservation(
    int id,
    String token,
  ) async {
    final _response = await api.companiesChild(id, token);

    return _response;
  }

  Future<Box> companiesBox() async {
    final _database = DatabaseHelper();

    final _key = await _database.keyBox();

    final _box = await _database.open(
      'companies',
      key: _key,
    );

    return _box;
  }

  Future<void> storeData({
    @required List<String> data,
  }) async {
    final _box = await companiesBox();

    await _box.put('filter', data);
  }

  Future<List<String>> retrieveData({
    @required String name,
    dynamic value,
  }) async {
    final _box = await companiesBox();

    final _data = _box.get(
      name,
      defaultValue: value,
    );

    return _data;
  }
}
