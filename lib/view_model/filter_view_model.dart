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

    final url = await userRepository.store('get', name: 'api_url');
    final token = await userRepository.store('get', name: 'token');

    await filterRepository
        .populate('$url/api/admin/v1', 'Bearer $token')
        .then((_) => callback(const Success()))
        .catchError((error) => callback(Failure(error: error)));
  }

  Future<void> requestFilter(Map<String, dynamic> credential) async {
    callback(const Loading());
  }
}
