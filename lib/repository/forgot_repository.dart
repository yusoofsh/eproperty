import 'package:eproperty/helper/dio_helper.dart';
import 'package:eproperty/model/base_model.dart';
import 'package:eproperty/service/rest_service.dart';

class ForgotRepository {
  final rest = RestService(dio);

  Future<BaseModel> requestForgot(
    Map<String, String> body,
  ) async {
    final _response = await rest.authForgot(
      body,
    );

    return _response;
  }

  Future<BaseModel> requestReset(
    Map<String, dynamic> body,
  ) async {
    final _response = await rest.authReset(
      body,
    );

    return _response;
  }
}
