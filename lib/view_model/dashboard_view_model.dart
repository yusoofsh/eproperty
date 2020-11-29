import 'package:eproperty/model/sales_model.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/sales_repository.dart';
import 'package:eproperty/repository/user_repository.dart';

class DashboardViewModel {
  final companiesRepository = CompaniesRepository();
  final salesRepository = SalesRepository();
  final userRepository = UserRepository();

  Future<Map<String, String>> api() async {
    final _apiUrl = await userRepository.retrieveData(
      name: 'api_url',
      value: '',
    ) as String;

    final _apiKey = await userRepository.retrieveData(
      name: 'api_key',
      value: '',
    ) as String;

    final _result = {
      'url': _apiUrl,
      'key': _apiKey,
    };

    return _result;
  }

  Future<Map<String, dynamic>> companies() async {
    final _project = await companiesRepository.retrieveData(
      name: 'project',
    ) as String;

    final _year = await companiesRepository.retrieveData(
      name: 'year',
    ) as int;

    final _month = await companiesRepository.retrieveData(
      name: 'month',
    ) as int;

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
    String project,
    int year,
    int month,
  }) async {
    final _response = await salesRepository.requestSalesReservation(
      url: apiUrl,
      key: apiKey,
      project: project,
      year: year,
      month: month,
    );

    return _response;
  }

  Future<SalesMailOrderModel> populateSalesMailOrder({
    String apiUrl,
    String apiKey,
    String project,
    int year,
    int month,
  }) async {
    final _response = await salesRepository.requestSalesMailOrder(
      url: apiUrl,
      key: apiKey,
      project: project,
      year: year,
      month: month,
    );

    return _response;
  }

  Future<List<SalesModel>> populateData() async {
    final _api = await api();
    final _data = await companies();

    final _apiUrl = _api['url'];
    final _apiKey = _api['key'];

    final _project = _data['project'] as String;
    final _year = _data['year'] as int;
    final _month = _data['month'] as int;

    final _response = await Future.wait([
      populateSalesReservation(
        apiUrl: _apiUrl,
        apiKey: _apiKey,
        project: _project,
        year: _year,
        month: _month,
      ),
      populateSalesMailOrder(
        apiUrl: _apiUrl,
        apiKey: _apiKey,
        project: _project,
        year: _year,
        month: _month,
      ),
    ]);

    return _response;
  }
}
