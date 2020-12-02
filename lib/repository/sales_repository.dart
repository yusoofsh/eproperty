import 'package:eproperty/helper/dio_helper.dart';
import 'package:eproperty/model/sales_model.dart';
import 'package:eproperty/service/rest_service.dart';
import 'package:flutter/foundation.dart';

class SalesRepository {
  RestService rest({@required String url}) {
    return RestService(
      dio,
      baseUrl: url,
    );
  }

  Future<SalesReservationModel> requestSalesReservation({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(
      url: url,
    ).salesReservation(
      key,
      data,
    );

    return _response;
  }

  Future<SalesMailOrderModel> requestSalesMailOrder({
    @required String url,
    @required String key,
    @required Map<String, dynamic> data,
  }) async {
    final _response = await rest(
      url: url,
    ).salesMailOrder(
      key,
      data,
    );

    return _response;
  }
}
