// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
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
  Future<SalesReservationModel> salesReservation(
      authentication, project, year, month) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(project, 'project');
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'project': project,
      r'year': year,
      r'month': month
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/reservasi',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SalesReservationModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<SalesMailOrderModel> salesMailOrder(
      authentication, project, year, month) async {
    ArgumentError.checkNotNull(authentication, 'authentication');
    ArgumentError.checkNotNull(project, 'project');
    ArgumentError.checkNotNull(year, 'year');
    ArgumentError.checkNotNull(month, 'month');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'project': project,
      r'year': year,
      r'month': month
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/suratpesanan',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'ApiKey': authentication},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SalesMailOrderModel.fromJson(_result.data);
    return value;
  }
}
