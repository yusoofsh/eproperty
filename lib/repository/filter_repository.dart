import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/service/api_service.dart';

class FilterRepository {
  ApiService api = ApiService(dio);

  Future<CompaniesModel> populate(String token) async {
    return api.companiesActive(token);
  }
}
