import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/repository/filter_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/foundation.dart';

class FilterViewModel extends ChangeNotifier with ActionMixin {
  final filterRepository = FilterRepository();
  final userRepository = UserRepository();

  List<Datum> companiesActive = <Datum>[];
  List<Datum> companiesChild = <Datum>[];

  int selectedItem;

  void setSelectedItem(Datum item) {
    selectedItem = item.id;

    notifyListeners();
  }

  Future<void> populateCompaniesActive() async {
    final token = 'bearer ${userRepository.store('get', name: 'token')}';

    final result = await filterRepository.requestCompaniesActive(token);

    companiesActive = result.data;

    notifyListeners();
  }

  Future<void> populateCompaniesChild() async {
    final token = 'bearer ${await userRepository.store('get', name: 'token')}';

    final result = await filterRepository.requestCompaniesChild(
      selectedItem,
      token,
    );

    companiesChild = result.data;

    notifyListeners();
  }

  Future<void> requestFilter(Map<String, dynamic> credential) async {
    callback(const Loading());
  }
}
