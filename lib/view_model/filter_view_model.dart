import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/repository/filter_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/foundation.dart';

class FilterViewModel extends ChangeNotifier with ActionMixin {
  final filterRepository = FilterRepository();
  final userRepository = UserRepository();

  List<Datum> companiesActive = <Datum>[];
  List<Datum> companiesChild = <Datum>[];

  Future<String> getToken() async {
    return 'Bearer ${await userRepository.store(
      'get',
      name: 'token',
    )}';
  }

  Future<void> populateCompaniesActive() async {
    final result = await filterRepository.requestCompaniesActive(
      await getToken(),
    );

    companiesActive.clear();
    companiesActive = result.data;

    notifyListeners();
  }

  Future<void> populateCompaniesChild(Datum item) async {
    companiesChild.clear();

    notifyListeners();

    final result = await filterRepository.requestCompaniesChild(
      item.id,
      await getToken(),
    );

    companiesChild = result.data;

    notifyListeners();
  }

  Future<void> requestFilter(Map<String, Datum> credential) async {}
}
