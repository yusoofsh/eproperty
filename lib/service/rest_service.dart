import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:eproperty/model/base_model.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/model/finance/month_summary.dart';
import 'package:eproperty/model/sales/aging_reservation.dart';
import 'package:eproperty/model/sales/cancel_reason.dart';
import 'package:eproperty/model/sales/cancel_status.dart';
import 'package:eproperty/model/sales/kpr_status.dart';
import 'package:eproperty/model/sales/legal_unit_status.dart';
import 'package:eproperty/model/sales/mail_order.dart';
import 'package:eproperty/model/sales/reservation.dart';
import 'package:eproperty/model/sales/sales.dart';
import 'package:eproperty/model/sales/sales_as_of.dart';
import 'package:eproperty/model/sales/sales_by_payment.dart';
import 'package:eproperty/model/sales/top_sales.dart';
import 'package:eproperty/model/sales/unit_status.dart';
import 'package:eproperty/model/sales/unit_stock_per_type.dart';
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
  Future<Reservation> salesReservation(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/suratpesanan')
  Future<MailOrder> salesMailOrder(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/statusunit')
  Future<UnitStatus> unitStatus(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/statusbatal')
  Future<CancelStatus> cancelStatus(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/topsales')
  Future<TopSales> topSales(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/penjualan')
  Future<Sales> sales(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/penjualanasof')
  Future<SalesAsOf> salesAsOf(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/penjualanbypayment')
  Future<SalesByPayment> salesByPayment(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/alasanbatal')
  Future<CancelReason> cancelReason(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/agingreservasi')
  Future<AgingReservation> agingReservation(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/stockunitpertype')
  Future<UnitStockPerType> unitStockPerType(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/statuskpr')
  Future<KprStatus> kprStatus(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/statuslegalunit')
  Future<LegalUnitStatus> legalUnitStatus(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/pembayaranhutang')
  Future<MonthSummary> debtPayments(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/piutangjt')
  Future<MonthSummary> dueCredit(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/outstandingretensi')
  Future<MonthSummary> outstandingRetention(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/realisasiretensi')
  Future<MonthSummary> retentionRealization(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );
}
