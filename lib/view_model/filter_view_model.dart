import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/repository/filter_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterViewModel extends ChangeNotifier with ActionMixin {
  final container = ProviderContainer();
  final filterRepository = FilterRepository();
  final userRepository = UserRepository();

  List<Datum> companies = <Datum>[];

  String getToken() {
    return 'Bearer ${userRepository.store(
      'get',
      name: 'token',
    )}';
  }

  void prepareData() {
    populateCompanies().then((value) {
      companies = value.data;
      notifyListeners();
    });
  }

  Future<CompaniesModel> populateCompanies() async {
    callback(const Loading());

    return filterRepository.populate(getToken()).whenComplete(
      () {
        callback(const Dismiss());
      },
    );
  }

  void selectedCompanies(Datum value) {
    return;
  }

  Future<void> requestFilter(Map<String, dynamic> credential) async {
    callback(const Loading());
  }
}
