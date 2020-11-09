import 'package:eproperty/helper/api_helper.dart';
import 'package:eproperty/service/api_service.dart';

class ForgotRepository {
  Future<dynamic> requestForgot(Map<String, dynamic> body) async {
    dynamic payload;

    await ApiService(dio)
        .authForgot(body)
        .then((value) => payload = value)
        .catchError((error) => payload = error);

    return payload;
  }

  Future<dynamic> requestReset(Map<String, dynamic> body) async {
    dynamic payload;

    await ApiService(dio)
        .authReset(body)
        .then((value) => payload = value)
        .catchError((error) => payload = error);

    return payload;
  }
}
