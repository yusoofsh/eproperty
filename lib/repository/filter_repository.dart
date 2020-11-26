import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/service/api_service.dart';

class FilterRepository {
  dynamic payload;

  ApiService api = ApiService(dio);

  Future<dynamic> populate(String token) async {
    await api
        .companiesActive(token)
        .then((value) => payload = value)
        .catchError((error) => payload = error);

    return payload;
  }
}
