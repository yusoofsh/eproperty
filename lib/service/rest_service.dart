import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:eproperty/model/accounting/cash_flow.dart';
import 'package:eproperty/model/accounting/cash_ratio.dart';
import 'package:eproperty/model/accounting/debt.dart';
import 'package:eproperty/model/accounting/debt_payments.dart';
import 'package:eproperty/model/accounting/profit.dart';
import 'package:eproperty/model/base_model.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/model/finance/aging_debt.dart';
import 'package:eproperty/model/finance/collection_percentage.dart';
import 'package:eproperty/model/finance/debt_acceptance.dart';
import 'package:eproperty/model/finance/hold_percentage.dart';
import 'package:eproperty/model/finance/kpr_reception.dart';
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

  @PATCH('/me/photo')
  Future<BaseModel> mePhoto(
    @Header(HttpHeaders.authorizationHeader) String authentication,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/me/password')
  Future<BaseModel> mePassword(
    @Header(HttpHeaders.authorizationHeader) String authentication,
    @Body() Map<String, dynamic> body,
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
  Future<MonthSummary> financeDebtPayments(
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

  @GET('/percentcoll')
  Future<CollectionPercentage> collectionPercentage(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/percenthold')
  Future<HoldPercentage> holdPercentage(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/agingpiutang')
  Future<AgingDebt> agingDebt(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/penerimaanhutang')
  Future<DebtAcceptance> debtAcceptance(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/penerimaankpr')
  Future<KprReception> kprReception(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/cashratio')
  Future<Ratio> cashRatio(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/currentratio')
  Future<Ratio> currentRatio(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/laba')
  Future<Profit> profit(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/cashflow')
  Future<CashFlow> cashFlow(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/pembayaranhutang')
  Future<DebtPayments> accountingDebtPayments(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/hutang')
  Future<Debt> debt(
    @Header('ApiKey') String authentication,
    @Queries() Map<String, dynamic> queries,
  );
}
