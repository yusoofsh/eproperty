import 'package:eproperty/model/sales_model.dart';
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
      'project': _project,
      'year': _year,
      'month': _month,
    };

    return _result;
  }

  Future<SalesReservationModel> populateSalesReservation({
    String apiUrl,
    String apiKey,
    Map<String, dynamic> data,
  }) async {
    final _response = await salesRepository.requestSalesReservation(
      url: apiUrl,
      key: apiKey,
      data: data,
    );

    return _response;
  }

  Future<SalesMailOrderModel> populateSalesMailOrder({
    String apiUrl,
    String apiKey,
    Map<String, dynamic> data,
  }) async {
    final _response = await salesRepository.requestSalesMailOrder(
      url: apiUrl,
      key: apiKey,
      data: data,
    );

    return _response;
  }

  Future<List<SalesModel>> fetchData() async {
    final _api = await api();
    final _data = await companies();

    final _apiUrl = _api['url'];
    final _apiKey = _api['key'];

    final _response = await Future.wait([
      populateSalesReservation(
        apiUrl: _apiUrl,
        apiKey: _apiKey,
        data: _data,
      ),
      populateSalesMailOrder(
        apiUrl: _apiUrl,
        apiKey: _apiKey,
        data: _data,
      ),
    ]);

    return _response;
  }
}

final dashboardViewModelProvider = FutureProvider<List<SalesModel>>(
  (_) async {
    final _response = DashboardViewModel().fetchData();

    return _response;
  },
);
