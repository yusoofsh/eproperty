import 'package:eproperty/helper/dio_helper.dart';
import 'package:eproperty/model/base_model.dart';
import 'package:eproperty/service/rest_service.dart';

class ForgotRepository {
  final rest = RestService(dio);

  Future<BaseModel> forgot(
    Map<String, String> body,
  ) async {
    final _response = await rest.authForgot(
      body,
    );

    return _response;
  }

  Future<BaseModel> reset(
    Map<String, dynamic> body,
  ) async {
    final _response = await rest.authReset(
      body,
    );

    return _response;
  }
}
