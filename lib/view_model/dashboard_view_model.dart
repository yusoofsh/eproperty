import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/sales_repository.dart';
import 'package:eproperty/repository/user_repository.dart';

class DashboardViewModel with ActionMixin {
  final companiesRepository = CompaniesRepository();
  final salesRepository = SalesRepository();
  final userRepository = UserRepository();

  Future<String> filter() async {
    final _filter = await companiesRepository.retrieveData(
      name: 'filter',
    );

    return _filter;
  }

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

  Future<void> populateData() async {
    final _api = await api();
    final _apiKey = _api['key'];
    final _apiUrl = _api['url'];

    String _project;
    int _month;
    int _year;

    salesRepository.requestSalesReservation(
      key: _apiKey,
      month: _month,
      project: _project,
      url: _apiUrl,
      year: _year,
    );
  }
}
