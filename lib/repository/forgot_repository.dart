import 'package:eproperty/helper/api_helper.dart';
import 'package:eproperty/service/api_service.dart';

class ForgotRepository {
  dynamic payload;

  Future<dynamic> requestForgot(Map<String, dynamic> body) async {
    await ApiService(dio)
        .authForgot(body)
        .then((response) => payload = response)
        .catchError((error) => payload = error);

    return payload;
  }

  Future<dynamic> requestReset(Map<String, dynamic> body) async {
    await ApiService(dio)
        .authReset(body)
        .then((value) => payload = value)
        .catchError((error) => payload = error);

    return payload;
  }
}
