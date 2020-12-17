import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/sales_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardViewModel {
  final companiesRepository = CompaniesRepository();
  final salesRepository = SalesRepository();
  final userRepository = UserRepository();

  Future<Map<String, String>> api() async {
    final _apiUrl = await userRepository.retrieveData<String>(
      name: 'api_url',
      value: '',
    );

    final _apiKey = await userRepository.retrieveData<String>(
      name: 'api_key',
      value: '',
    );

    final _result = {
      'url': _apiUrl,
      'key': _apiKey,
    };

    return _result;
  }

  Future<Map<String, dynamic>> companies() async {
    final _company = await companiesRepository.retrieveData<String>(
      name: 'company',
    );

    final _project = await companiesRepository.retrieveData<String>(
      name: 'project',
    );

    final _year = await companiesRepository.retrieveData<int>(
      name: 'year',
    );

    final _month = await companiesRepository.retrieveData<int>(
      name: 'month',
    );

    final _result = {
      'company': _company,
      'project': _project,
      'year': _year,
      'month': _month,
    };

    return _result;
  }

  Future<List<dynamic>> fetchData() async {
    final _api = await api();
    final _data = await companies();

    final _apiUrl = _api['url'];
    final _apiKey = _api['key'];

    final _response = await Future.wait<dynamic>(
      [
        salesRepository.requestReservation(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestMailOrder(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestUnitStatus(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestCancelStatus(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestTopSales(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestSales(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestSalesAsOf(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestSalesByPayment(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestCancelReason(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestAgingReservation(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestUnitStockPerType(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestKprStatus(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.requestLegalUnitStatus(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
      ],
    );

    return _response;
  }

  Future<String> company() async {
    final _companies = await companies();

    return _companies['company'] as String;
  }

  Future<int> year() async {
    final _companies = await companies();

    return _companies['year'] as int;
  }
}

final dataProvider = FutureProvider.autoDispose<List<dynamic>>(
  (_) => DashboardViewModel().fetchData(),
);

final companyProvider = FutureProvider<String>(
  (_) => DashboardViewModel().company(),
);

final yearProvider = FutureProvider<int>(
  (_) => DashboardViewModel().year(),
);
