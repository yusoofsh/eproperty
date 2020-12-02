import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:eproperty/model/base_model.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/model/sales_model.dart';
import 'package:eproperty/model/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_service.g.dart';

@RestApi(baseUrl: 'http://34.101.219.118/eproperty-admin/api/admin/v1')
abstract class RestService {
  factory RestService(Dio dio, {String baseUrl}) = _RestService;

  @POST('/auth/token')
  Future<UserModel> authToken(
    @Header(HttpHeaders.authorizationHeader) String authentication,
  );

  @POST('/auth/forgot')
  Future<BaseModel> authForgot(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/reset')
  Future<BaseModel> authReset(
    @Body() Map<String, dynamic> body,
  );

  @GET('/companies/active')
  Future<CompaniesModel> companiesActive(
    @Header(HttpHeaders.authorizationHeader) String authentication,
  );

  @GET('/companies/{id}/childs')
  Future<CompaniesModel> companiesChild(
    @Path() int id,
    @Header(HttpHeaders.authorizationHeader) String authentication,
  );

  @GET('/reservasi')
  Future<SalesReservationModel> salesReservation(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/suratpesanan')
  Future<SalesMailOrderModel> salesMailOrder(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );
}
