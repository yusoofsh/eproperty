// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestService implements RestService {
  _RestService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://34.101.219.118/eproperty-admin/api/admin/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UserModel> authToken(authentication) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/auth/token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'authorization': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseModel> mePhoto(authentication, body) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/me/photo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{r'authorization': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseModel> authForgot(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/auth/forgot',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseModel> authReset(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/auth/reset',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CompaniesModel> companiesActive(authentication) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/companies/active',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'authorization': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CompaniesModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CompaniesModel> companiesChild(id, authentication) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(authentication, 'authentication');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/companies/$id/childs',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'authorization': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CompaniesModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<Reservation> salesReservation(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/reservasi',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Reservation.fromJson(_result.data);
    return value;
  }

  @override
  Future<MailOrder> salesMailOrder(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/suratpesanan',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MailOrder.fromJson(_result.data);
    return value;
  }

  @override
  Future<UnitStatus> unitStatus(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/statusunit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UnitStatus.fromJson(_result.data);
    return value;
  }

  @override
  Future<CancelStatus> cancelStatus(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/statusbatal',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CancelStatus.fromJson(_result.data);
    return value;
  }

  @override
  Future<TopSales> topSales(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/topsales',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TopSales.fromJson(_result.data);
    return value;
  }

  @override
  Future<Sales> sales(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/penjualan',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Sales.fromJson(_result.data);
    return value;
  }

  @override
  Future<SalesAsOf> salesAsOf(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/penjualanasof',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SalesAsOf.fromJson(_result.data);
    return value;
  }

  @override
  Future<SalesByPayment> salesByPayment(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/penjualanbypayment',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SalesByPayment.fromJson(_result.data);
    return value;
  }

  @override
  Future<CancelReason> cancelReason(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/alasanbatal',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CancelReason.fromJson(_result.data);
    return value;
  }

  @override
  Future<AgingReservation> agingReservation(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/agingreservasi',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AgingReservation.fromJson(_result.data);
    return value;
  }

  @override
  Future<UnitStockPerType> unitStockPerType(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/stockunitpertype',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UnitStockPerType.fromJson(_result.data);
    return value;
  }

  @override
  Future<KprStatus> kprStatus(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/statuskpr',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = KprStatus.fromJson(_result.data);
    return value;
  }

  @override
  Future<LegalUnitStatus> legalUnitStatus(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/statuslegalunit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LegalUnitStatus.fromJson(_result.data);
    return value;
  }

  @override
  Future<MonthSummary> financeDebtPayments(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/pembayaranhutang',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MonthSummary.fromJson(_result.data);
    return value;
  }

  @override
  Future<MonthSummary> dueCredit(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/piutangjt',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MonthSummary.fromJson(_result.data);
    return value;
  }

  @override
  Future<MonthSummary> outstandingRetention(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/outstandingretensi',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MonthSummary.fromJson(_result.data);
    return value;
  }

  @override
  Future<MonthSummary> retentionRealization(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/realisasiretensi',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MonthSummary.fromJson(_result.data);
    return value;
  }

  @override
  Future<CollectionPercentage> collectionPercentage(
      authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/percentcoll',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CollectionPercentage.fromJson(_result.data);
    return value;
  }

  @override
  Future<HoldPercentage> holdPercentage(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/percenthold',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = HoldPercentage.fromJson(_result.data);
    return value;
  }

  @override
  Future<AgingDebt> agingDebt(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/agingpiutang',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AgingDebt.fromJson(_result.data);
    return value;
  }

  @override
  Future<DebtAcceptance> debtAcceptance(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/penerimaanhutang',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DebtAcceptance.fromJson(_result.data);
    return value;
  }

  @override
  Future<KprReception> kprReception(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/penerimaankpr',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = KprReception.fromJson(_result.data);
    return value;
  }

  @override
  Future<Ratio> cashRatio(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/cashratio',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Ratio.fromJson(_result.data);
    return value;
  }

  @override
  Future<Ratio> currentRatio(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/currentratio',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Ratio.fromJson(_result.data);
    return value;
  }

  @override
  Future<Profit> profit(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/laba',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Profit.fromJson(_result.data);
    return value;
  }

  @override
  Future<CashFlow> cashFlow(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/cashflow',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CashFlow.fromJson(_result.data);
    return value;
  }

  @override
  Future<DebtPayments> accountingDebtPayments(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/pembayaranhutang',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DebtPayments.fromJson(_result.data);
    return value;
  }

  @override
  Future<Debt> debt(authentication, queries) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/hutang',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Debt.fromJson(_result.data);
    return value;
  }
}
