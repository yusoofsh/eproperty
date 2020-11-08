import 'package:dio/dio.dart' hide Headers;
import 'package:eproperty/model/token_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://34.101.219.118/eproperty-admin/api/admin/v1')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/auth/token')
  Future<TokenModel> authToken();
}
