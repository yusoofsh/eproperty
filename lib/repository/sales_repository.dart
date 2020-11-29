import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/sales_model.dart';
import 'package:eproperty/service/api_service.dart';
import 'package:flutter/foundation.dart';

class SalesRepository {
  ApiService api({@required String url}) {
    return ApiService(
      dio,
      baseUrl: url,
    );
  }

  Future<SalesReservationModel> requestSalesReservation({
    @required String project,
    @required int year,
    @required int month,
    @required String url,
    @required String key,
  }) async {
    final _response = await api(
      url: url,
    ).salesReservation(
      key,
      project,
      year,
      month,
    );

    return _response;
  }
}
