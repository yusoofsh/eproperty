import 'package:eproperty/helper/dio_helper.dart';
import 'package:eproperty/model/sales/aging_reservation.dart';
import 'package:eproperty/model/sales/cancel_reason.dart';
import 'package:eproperty/model/sales/cancel_status.dart';
import 'package:eproperty/model/sales/kpr_status.dart';
import 'package:eproperty/model/sales/legal_unit_status.dart';
import 'package:eproperty/model/sales/mail_order.dart';
import 'package:eproperty/model/sales/reservation.dart';
import 'package:eproperty/model/sales/sales_as_of.dart';
import 'package:eproperty/model/sales/sales_by_payment.dart';
import 'package:eproperty/model/sales/top_sales.dart';
import 'package:eproperty/model/sales/unit_status.dart';
import 'package:eproperty/model/sales/unit_stock_per_type.dart';
import 'package:eproperty/service/rest_service.dart';
import 'package:flutter/foundation.dart';

class SalesRepository {
  RestService rest({@required String url}) {
    return RestService(
      dio,
      baseUrl: '$url/api/sales/v1',
    );
  }

  Future<Reservation> requestSalesReservation({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).salesReservation(
      key,
      data,
    );

    return _response;
  }

  Future<MailOrder> requestSalesMailOrder({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).salesMailOrder(
      key,
      data,
    );

    return _response;
  }

  Future<UnitStatus> requestUnitStatus({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).unitStatus(
      key,
      data,
    );

    return _response;
  }

  Future<CancelStatus> requestCancelStatus({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).cancelStatus(
      key,
      data,
    );

    return _response;
  }

  Future<TopSales> requestTopSales({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).topSales(
      key,
      data,
    );

    return _response;
  }

  Future<SalesAsOf> requestSalesAsOf({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).salesAsOf(
      key,
      data,
    );

    return _response;
  }

  Future<SalesByPayment> requestSalesByPayment({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).salesByPayment(
      key,
      data,
    );

    return _response;
  }

  Future<CancelReason> requestCancelReason({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).cancelReason(
      key,
      data,
    );

    return _response;
  }

  Future<AgingReservation> requestAgingReservation({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).agingReservation(
      key,
      data,
    );

    return _response;
  }

  Future<UnitStockPerType> requestUnitStockPerType({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).unitStockPerType(
      key,
      data,
    );

    return _response;
  }

  Future<KprStatus> requestKprStatus({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).kprStatus(
      key,
      data,
    );

    return _response;
  }

  Future<LegalUnitStatus> requestLegalUnitStatus({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(url: url).legalUnitStatus(
      key,
      data,
    );

    return _response;
  }
}
