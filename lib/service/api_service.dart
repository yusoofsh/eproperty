import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:eproperty/model/base_model.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/model/sales_model.dart';
import 'package:eproperty/model/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://34.101.219.118/eproperty-admin/api/admin/v1')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

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

  @GET('/reservasi?project=SG&year=2020&month=3')
  Future<SalesReservationModel> salesReservation(
    @Header('ApiKey') String authentication,
    @Query('project') String project,
    @Query('year') int year,
    @Query('month') int month,
  );
}
