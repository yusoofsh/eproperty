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

  Future<MonthSummary> requestDebtPayments({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).debtPayments(
      key,
      data,
    );

    return _response;
  }

  Future<MonthSummary> requestdueCredit({
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

  Future<MonthSummary> requestOutstandingRetention({
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

  Future<MonthSummary> requestRetentionRealization({
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

  Future<CollectionPercentage> requestCollectionPercentage({
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

  Future<HoldPercentage> requestHoldPercentage({
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

  Future<AgingDebt> requestAgingDebt({
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

  Future<DebtAcceptance> requestDebtAcceptance({
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

  Future<KprReception> requestKprReception({
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
