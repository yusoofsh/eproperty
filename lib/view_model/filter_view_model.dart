import 'package:dio/dio.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterState {
  dismiss,
  failure,
  loading,
  next,
  success,
}

class FilterViewModel extends ChangeNotifier {
  final companiesRepository = CompaniesRepository();
  final userRepository = UserRepository();

  FilterState state = FilterState.loading;
  List<Datum> companiesActive = [];
  List<Datum> companiesChild = [];

  List<int> years;
  Map<int, String> months;
  String message;

  Future<String> token() async {
    final _token = 'Bearer ${await userRepository.retrieveData<String>(
      name: 'token',
      value: '',
    )}';

    return _token;
  }

  Future<void> populateCompaniesActive() async {
    try {
      final _response = await companiesRepository.requestCompaniesActive(
        await token(),
      );

      if (_response.data.isNotEmpty) {
        companiesActive = _response.data;
      }

      state = FilterState.dismiss;

      notifyListeners();
    } on DioError catch (error) {
      message = error.response.data['message'] as String;

      state = FilterState.failure;

      notifyListeners();
    }
  }

  Future<void> populateCompaniesChild(int item) async {
    try {
      final _response = await companiesRepository.requestCompaniesChild(
        item,
        await token(),
      );

      if (companiesChild != null) {
        companiesChild.clear();
      }

      if (_response.data.isNotEmpty) {
        companiesChild.addAll(_response.data);
      }

      state = FilterState.dismiss;

      notifyListeners();
    } on DioError catch (error) {
      message = error.response.data['message'] as String;

      state = FilterState.failure;

      notifyListeners();
    }
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

    state = FilterState.next;

    notifyListeners();
  }

  Future<void> storeCompaniesPreference(
    Map<String, dynamic> data,
  ) async {
    try {
      await companiesRepository.storeData(data: data);

      state = FilterState.success;

      notifyListeners();
    } catch (error) {
      message = error as String;
      state = FilterState.failure;

      notifyListeners();
    }
  }
}

final filterViewModelProvider = ChangeNotifierProvider(
  (_) => FilterViewModel(),
);
