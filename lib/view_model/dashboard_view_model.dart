import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/user_repository.dart';

class DashboardViewModel with ActionMixin {
  final userRepository = UserRepository();
  final companiesRepository = CompaniesRepository();

  Future<List<dynamic>> filter() async {
    final _filter = await companiesRepository.retrieveData(
      name: 'filter',
    );

    return _filter;
  }

  Future<String> token() async {
    final _token = 'Bearer ${await userRepository.retrieveData(
      name: 'token',
    )}';

    return _token;
  }

  void populateData() {}
}
