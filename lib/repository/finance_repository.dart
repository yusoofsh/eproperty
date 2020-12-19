import 'package:eproperty/helper/dio_helper.dart';
import 'package:eproperty/model/finance/aging_debt.dart';
import 'package:eproperty/model/finance/collection_percentage.dart';
import 'package:eproperty/model/finance/debt_acceptance.dart';
import 'package:eproperty/model/finance/hold_percentage.dart';
import 'package:eproperty/model/finance/kpr_reception.dart';
import 'package:eproperty/model/finance/month_summary.dart';
import 'package:eproperty/service/rest_service.dart';
import 'package:flutter/foundation.dart';

class FinanceRepository {
  RestService rest({@required String url}) {
    return RestService(
      dio,
      baseUrl: '$url/api/finances/v1',
    );
  }

  Future<MonthSummary> debtPayments({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).financeDebtPayments(
      key,
      data,
    );

    return _response;
  }

  Future<MonthSummary> dueCredit({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).dueCredit(
      key,
      data,
    );

    return _response;
  }

  Future<MonthSummary> outstandingRetention({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).outstandingRetention(
      key,
      data,
    );

    return _response;
  }

  Future<MonthSummary> retentionRealization({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).retentionRealization(
      key,
      data,
    );

    return _response;
  }

  Future<CollectionPercentage> collectionPercentage({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).collectionPercentage(
      key,
      data,
    );

    return _response;
  }

  Future<HoldPercentage> holdPercentage({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).holdPercentage(
      key,
      data,
    );

    return _response;
  }

  Future<AgingDebt> agingDebt({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).agingDebt(
      key,
      data,
    );

    return _response;
  }

  Future<DebtAcceptance> debtAcceptance({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).debtAcceptance(
      key,
      data,
    );

    return _response;
  }

  Future<KprReception> kprReception({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).kprReception(
      key,
      data,
    );

    return _response;
  }
}
