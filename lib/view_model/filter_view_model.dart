import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/repository/filter_repository.dart';
import 'package:eproperty/repository/user_repository.dart';

class FilterViewModel with ActionMixin {
  final filterRepository = FilterRepository();
  final userRepository = UserRepository();

  Future<void> populateCompanies() async {
    callback(const Loading());

    final token = 'Bearer ${await userRepository.store('get', name: 'token')}';

    await filterRepository
        .populate(token)
        .whenComplete(() => callback(const Dismiss()));
  }

  Future<void> requestFilter(Map<String, dynamic> credential) async {
    callback(const Loading());
  }
}
