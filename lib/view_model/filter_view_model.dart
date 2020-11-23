import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/repository/filter_repository.dart';
import 'package:eproperty/repository/user_repository.dart';

class FilterViewModel with ActionMixin {
  final filterRepository = FilterRepository();
  final userRepository = UserRepository();

  Future<void> populate() async {
    callback(const Loading());

    final apiUrl = await userRepository.store('get', name: 'api_url');
    final apiKey = await userRepository.store('get', name: 'api_key');

    await filterRepository
        .populate(apiUrl, 'Bearer $apiKey')
        .then((_) => callback(const Success()))
        .catchError((error) => callback(Failure(error: error)));
  }

  Future<void> request(Map<String, dynamic> credential) async {
    callback(const Loading());
  }
}
