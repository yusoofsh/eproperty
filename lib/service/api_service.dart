import 'package:dio/dio.dart' hide Headers;
import 'package:eproperty/model/base_model.dart';
import 'package:eproperty/model/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://34.101.219.118/eproperty-admin/api/admin/v1')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/auth/token')
  Future<UserModel> authToken();

  @POST('/auth/forgot')
  Future<BaseModel> authForgot(@Body() Map<String, dynamic> body);

  @POST('/auth/reset')
  Future<BaseModel> authReset(@Body() Map<String, dynamic> body);
}