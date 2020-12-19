import 'package:eproperty/helper/dio_helper.dart';
import 'package:eproperty/model/accounting/cash_flow.dart';
import 'package:eproperty/model/accounting/cash_ratio.dart';
import 'package:eproperty/model/accounting/debt.dart';
import 'package:eproperty/model/accounting/debt_payments.dart';
import 'package:eproperty/model/accounting/profit.dart';
import 'package:eproperty/service/rest_service.dart';
import 'package:flutter/foundation.dart';

class AccountingRepository {
  RestService rest({@required String url}) {
    return RestService(
      dio,
      baseUrl: '$url/api/accounting/v1',
    );
  }

  Future<Ratio> cashRatio({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).cashRatio(
      key,
      data,
    );

    return _response;
  }

  Future<Ratio> currentRatio({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).currentRatio(
      key,
      data,
    );

    return _response;
  }

  Future<Profit> profit({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).profit(
      key,
      data,
    );

    return _response;
  }

  Future<CashFlow> cashFlow({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).cashFlow(
      key,
      data,
    );

    return _response;
  }

  Future<DebtPayments> debtPayments({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).accountingDebtPayments(
      key,
      data,
    );

    return _response;
  }

  Future<Debt> debt({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).debt(
      key,
      data,
    );

    return _response;
  }
}
