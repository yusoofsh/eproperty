import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/foundation.dart';

class FilterViewModel extends ChangeNotifier with ActionMixin {
  final companiesRepository = CompaniesRepository();
  final userRepository = UserRepository();

  List<Datum> companiesActive = <Datum>[];
  List<Datum> companiesChild = <Datum>[];

  Future<String> token() async {
    final _token = 'Bearer ${await userRepository.retrieveData(
      name: 'token',
    )}';

    return _token;
  }

  Future<void> populateCompaniesActive() async {
    final _response = await companiesRepository.requestCompaniesActive(
      await token(),
    );

    companiesActive.addAll(_response.data);

    notifyListeners();
  }

  Future<void> populateCompaniesChild(int item) async {
    final _response = await companiesRepository.requestCompaniesChild(
      item,
      await token(),
    );

    companiesChild.addAll(_response.data);

    notifyListeners();
  }

  Future<void> storeSelectedCompanies(
    Map<String, Datum> data,
  ) async {
    final _name = <String>[];

    for (final _datum in data.values) {
      _name.add(_datum.name);
    }

    await companiesRepository.storeData(data: _name).whenComplete(() {
      callback(const Success());
    });
  }
}
