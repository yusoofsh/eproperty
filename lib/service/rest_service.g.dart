// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestService implements RestService {
  _RestService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://34.101.219.118/eproperty-admin/api/admin/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UserModel> authToken(authentication) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'authorization': authentication},
                extra: _extra)
            .compose(_dio.options, '/auth/token', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseModel> mePhoto(authentication, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseModel>(Options(
                method: 'PATCH',
                headers: <String, dynamic>{r'authorization': authentication},
                extra: _extra)
            .compose(_dio.options, '/me/photo', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseModel> mePassword(authentication, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseModel>(Options(
                method: 'PATCH',
                headers: <String, dynamic>{r'authorization': authentication},
                extra: _extra)
            .compose(_dio.options, '/me/password', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseModel> authForgot(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/auth/forgot', _data,
                    queryParameters: queryParameters)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseModel> authReset(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/auth/reset', _data,
                    queryParameters: queryParameters)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CompaniesModel> companiesActive(authentication) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CompaniesModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'authorization': authentication},
                extra: _extra)
            .compose(_dio.options, '/companies/active', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CompaniesModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CompaniesModel> companiesChild(id, authentication) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CompaniesModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'authorization': authentication},
                extra: _extra)
            .compose(_dio.options, '/companies/$id/childs', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CompaniesModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<Reservation> salesReservation(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Reservation>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/reservasi', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Reservation.fromJson(_result.data);
    return value;
  }

  @override
  Future<MailOrder> salesMailOrder(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MailOrder>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/suratpesanan', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MailOrder.fromJson(_result.data);
    return value;
  }

  @override
  Future<UnitStatus> unitStatus(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UnitStatus>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/statusunit', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UnitStatus.fromJson(_result.data);
    return value;
  }

  @override
  Future<CancelStatus> cancelStatus(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CancelStatus>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/statusbatal', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CancelStatus.fromJson(_result.data);
    return value;
  }

  @override
  Future<TopSales> topSales(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TopSales>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/topsales', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TopSales.fromJson(_result.data);
    return value;
  }

  @override
  Future<Sales> sales(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Sales>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/penjualan', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Sales.fromJson(_result.data);
    return value;
  }

  @override
  Future<SalesAsOf> salesAsOf(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SalesAsOf>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/penjualanasof', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SalesAsOf.fromJson(_result.data);
    return value;
  }

  @override
  Future<SalesByPayment> salesByPayment(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SalesByPayment>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/penjualanbypayment', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SalesByPayment.fromJson(_result.data);
    return value;
  }

  @override
  Future<CancelReason> cancelReason(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CancelReason>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/alasanbatal', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CancelReason.fromJson(_result.data);
    return value;
  }

  @override
  Future<AgingReservation> agingReservation(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AgingReservation>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/agingreservasi', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AgingReservation.fromJson(_result.data);
    return value;
  }

  @override
  Future<UnitStockPerType> unitStockPerType(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UnitStockPerType>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/stockunitpertype', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UnitStockPerType.fromJson(_result.data);
    return value;
  }

  @override
  Future<KprStatus> kprStatus(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KprStatus>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/statuskpr', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KprStatus.fromJson(_result.data);
    return value;
  }

  @override
  Future<LegalUnitStatus> legalUnitStatus(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LegalUnitStatus>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/statuslegalunit', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LegalUnitStatus.fromJson(_result.data);
    return value;
  }

  @override
  Future<MonthSummary> financeDebtPayments(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MonthSummary>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/pembayaranhutang', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MonthSummary.fromJson(_result.data);
    return value;
  }

  @override
  Future<MonthSummary> dueCredit(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MonthSummary>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/piutangjt', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MonthSummary.fromJson(_result.data);
    return value;
  }

  @override
  Future<MonthSummary> outstandingRetention(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MonthSummary>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/outstandingretensi', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MonthSummary.fromJson(_result.data);
    return value;
  }

  @override
  Future<MonthSummary> retentionRealization(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MonthSummary>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/realisasiretensi', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MonthSummary.fromJson(_result.data);
    return value;
  }

  @override
  Future<CollectionPercentage> collectionPercentage(
      authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CollectionPercentage>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/percentcoll', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CollectionPercentage.fromJson(_result.data);
    return value;
  }

  @override
  Future<HoldPercentage> holdPercentage(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HoldPercentage>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/percenthold', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HoldPercentage.fromJson(_result.data);
    return value;
  }

  @override
  Future<AgingDebt> agingDebt(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AgingDebt>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/agingpiutang', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AgingDebt.fromJson(_result.data);
    return value;
  }

  @override
  Future<DebtAcceptance> debtAcceptance(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DebtAcceptance>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/penerimaanhutang', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DebtAcceptance.fromJson(_result.data);
    return value;
  }

  @override
  Future<KprReception> kprReception(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KprReception>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/penerimaankpr', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KprReception.fromJson(_result.data);
    return value;
  }

  @override
  Future<Ratio> cashRatio(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Ratio>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/cashratio', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Ratio.fromJson(_result.data);
    return value;
  }

  @override
  Future<Ratio> currentRatio(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Ratio>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/currentratio', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Ratio.fromJson(_result.data);
    return value;
  }

  @override
  Future<Profit> profit(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Profit>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/laba', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Profit.fromJson(_result.data);
    return value;
  }

  @override
  Future<CashFlow> cashFlow(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CashFlow>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/cashflow', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CashFlow.fromJson(_result.data);
    return value;
  }

  @override
  Future<DebtPayments> accountingDebtPayments(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DebtPayments>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/pembayaranhutang', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DebtPayments.fromJson(_result.data);
    return value;
  }

  @override
  Future<Debt> debt(authentication, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Debt>(
        Options(
                method: 'GET',
                headers: <String, dynamic>{r'ApiKey': authentication},
                extra: _extra)
            .compose(_dio.options, '/hutang', _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Debt.fromJson(_result.data);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
