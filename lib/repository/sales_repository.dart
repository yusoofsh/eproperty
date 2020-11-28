import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/service/api_service.dart';

class CompaniesRepository {
  final api = ApiService(dio);

  Future<CompaniesModel> requestSalesReservation(
    int id,
    String token,
  ) async {
    final _response = await api.companiesChild(id, token);

    return _response;
  }
}
