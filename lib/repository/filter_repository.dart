import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/service/api_service.dart';

class FilterRepository {
  dynamic payload;

  Future<dynamic> populate(String apiUrl, String apiKey) async {
    await ApiService(dio, baseUrl: apiUrl)
        .companiesActive(apiKey)
        .then((value) => payload = value)
        .catchError((error) => payload = error);

    return payload;
  }
}
