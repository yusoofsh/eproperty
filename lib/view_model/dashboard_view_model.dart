import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/finance_repository.dart';
import 'package:eproperty/repository/sales_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardViewModel {
  final companiesRepository = CompaniesRepository();
  final salesRepository = SalesRepository();
  final financeRepository = FinanceRepository();
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

  Future<String> company() async {
    final _companies = await companies();

    return _companies['company'] as String;
  }

  Future<int> year() async {
    final _companies = await companies();

    return _companies['year'] as int;
  }

  Future<List<dynamic>> fetchSalesData() async {
    final _api = await api();
    final _data = await companies();

    final _apiUrl = _api['url'];
    final _apiKey = _api['key'];

    final _response = await Future.wait<dynamic>(
      [
        salesRepository.reservation(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.mailOrder(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.unitStatus(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.cancelStatus(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.topSales(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.sales(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.salesAsOf(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.salesByPayment(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.cancelReason(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.agingReservation(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.unitStockPerType(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.kprStatus(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        salesRepository.legalUnitStatus(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
      ],
    );

    return _response;
  }

  Future<List<dynamic>> fetchFinanceData() async {
    final _api = await api();
    final _data = await companies();

    final _apiUrl = _api['url'];
    final _apiKey = _api['key'];

    final _response = await Future.wait<dynamic>(
      [
        financeRepository.debtPayments(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        financeRepository.dueCredit(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        financeRepository.outstandingRetention(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        financeRepository.retentionRealization(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        financeRepository.collectionPercentage(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        financeRepository.holdPercentage(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        financeRepository.agingDebt(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        financeRepository.debtAcceptance(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        financeRepository.kprReception(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
      ],
    );

    return _response;
  }
}

final salesDataProvider = FutureProvider<List<dynamic>>(
  (_) => DashboardViewModel().fetchSalesData(),
);

final financeDataProvider = FutureProvider<List<dynamic>>(
  (_) => DashboardViewModel().fetchFinanceData(),
);

final currentCompanyProvider = FutureProvider<String>(
  (_) => DashboardViewModel().company(),
);

final currentYearProvider = FutureProvider<int>(
  (_) => DashboardViewModel().year(),
);

final selectedIndexProvider = StateProvider<int>((_) => 1);
