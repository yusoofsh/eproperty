import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:eproperty/helper/hive_helper.dart';
import 'package:eproperty/repository/accounting_repository.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/finance_repository.dart';
import 'package:eproperty/repository/sales_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DashboardViewModel {
  final companiesRepository = CompaniesRepository();
  final salesRepository = SalesRepository();
  final financeRepository = FinanceRepository();
  final accountingRepository = AccountingRepository();
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

  Future<List<dynamic>> fetchAccountingData() async {
    final _api = await api();
    final _data = await companies();

    final _apiUrl = _api['url'];
    final _apiKey = _api['key'];

    final _response = await Future.wait<dynamic>(
      [
        accountingRepository.cashRatio(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        accountingRepository.currentRatio(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        accountingRepository.profit(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        accountingRepository.cashFlow(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        accountingRepository.debtPayments(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
        accountingRepository.debt(
          url: _apiUrl,
          key: _apiKey,
          data: _data,
        ),
      ],
    );

    return _response;
  }

  Future<List<String>> fetchUserData() async {
    final _result = await Future.wait<String>(
      [
        userRepository.retrieveData<String>(
          name: 'name',
          value: '',
        ),
        userRepository.retrieveData<String>(
          name: 'email',
          value: '',
        ),
        userRepository.retrieveData<String>(
          name: 'image',
          value: '',
        ),
      ],
    );

    return _result;
  }

  String formatToIdr(num value, {String name}) {
    final _parsed = NumberFormat.currency(
      locale: 'id',
      name: name ?? 'Rp. ',
      decimalDigits: 0,
    ).format(value);

    return _parsed;
  }

  Future<String> token() async {
    return 'Bearer ${await userRepository.retrieveData<String>(
      name: 'token',
      value: '',
    )}';
  }

  Future<bool> changePhoto() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final path = pickedFile.path;
      final bytes = File(path).readAsBytesSync();
      final image = base64Encode(bytes);
      final extension = path.substring(path.length - 3);
      final data = {'image': 'data:image/$extension;base64,$image'};
      bool success;

      try {
        await userRepository.changePhoto(await token(), data);

        success = true;
      } on DioError catch (_) {
        success = false;
      }

      if (success) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void logOut(BuildContext context) {
    HiveHelper().deleteFromDisk();

    context.navigator.pushAndRemoveUntil(Routes.logInView, (route) => false);
  }

  Future<bool> changePassword(Map<String, dynamic> data) async {
    bool success;

    try {
      await userRepository.changePassword(await token(), data);

      success = true;
    } on DioError catch (_) {
      success = false;
    }

    if (success) {
      return true;
    } else {
      return false;
    }
  }
}

final dashboardProvider = Provider<DashboardViewModel>(
  (_) => DashboardViewModel(),
);

final salesDataProvider = FutureProvider<List<dynamic>>(
  (_) => DashboardViewModel().fetchSalesData(),
);

final financeDataProvider = FutureProvider<List<dynamic>>(
  (_) => DashboardViewModel().fetchFinanceData(),
);

final accountingDataProvider = FutureProvider<List<dynamic>>(
  (_) => DashboardViewModel().fetchAccountingData(),
);

final userDataProvider = FutureProvider<List<String>>(
  (_) => DashboardViewModel().fetchUserData(),
);

final currentCompanyProvider = FutureProvider<String>(
  (_) => DashboardViewModel().company(),
);

final currentYearProvider = FutureProvider<int>(
  (_) => DashboardViewModel().year(),
);

final indexProvider = StateProvider<int>((_) => 0);
