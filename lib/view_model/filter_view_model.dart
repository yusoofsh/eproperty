import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/foundation.dart';

class FilterViewModel extends ChangeNotifier with ActionMixin {
  final companiesRepository = CompaniesRepository();
  final userRepository = UserRepository();

  List<Datum> companiesChild = [];
  List<Datum> companiesActive = [];
  List<int> years = [];
  Map<int, String> months = {};

  bool enableDateInput = false;

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

    companiesActive = _response.data;

    notifyListeners();
  }

  Future<void> populateCompaniesChild(int item) async {
    final _response = await companiesRepository.requestCompaniesChild(
      item,
      await token(),
    );

    companiesChild = _response.data;

    notifyListeners();
  }

  void configureDateInput() {
    for (int year = 2010; year <= DateTime.now().year; year++) {
      years.add(year);
    }

    months = {
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December',
    };

    enableDateInput = true;

    notifyListeners();
  }

  Future<void> storeCompaniesPreference(
    Map<String, dynamic> data,
  ) async {
    await companiesRepository.storeData(data: data).whenComplete(() {
      callback(const Success());
    });
  }
}
