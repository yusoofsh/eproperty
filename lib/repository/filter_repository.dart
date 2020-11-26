import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/service/api_service.dart';

class FilterRepository {
  dynamic payload;

  ApiService api(String baseUrl) => ApiService(dio, baseUrl: baseUrl);

  Future<dynamic> populate(String baseUrl, String bearer) async {
    await api(baseUrl)
        .companiesActive(bearer)
        .then((value) => payload = value)
        .catchError((error) => payload = error);

    return payload;
  }
}
