import 'package:eproperty/helper/api_helper.dart';
import 'package:eproperty/model/base_model.dart';
import 'package:eproperty/service/api_service.dart';

class ForgotRepository {
  final api = ApiService(dio);

  Future<BaseModel> requestForgot(
    Map<String, String> body,
  ) async {
    final _response = await api.authForgot(
      body,
    );

    return _response;
  }

  Future<BaseModel> requestReset(
    Map<String, dynamic> body,
  ) async {
    final _response = await api.authReset(
      body,
    );

    return _response;
  }
}
