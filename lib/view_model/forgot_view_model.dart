import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/repository/forgot_repository.dart';

class ForgotViewModel with ActionMixin {
  final forgotRepository = ForgotRepository();
  final databaseHelper = DatabaseHelper();

  Future<void> requestForgot(Map<String, dynamic> value) async {
    callback(const Loading());

    final _tempBox = await databaseHelper.openBox('temp');
    _tempBox.put('email', value['email']);

    await forgotRepository
        .requestForgot(value)
        .then((_) => callback(const Success()))
        .catchError((error) => callback(Failure(error: error)));
  }

  Future<void> requestReset(Map<String, dynamic> value) async {
    callback(const Loading());

    final _tempBox = databaseHelper.box('temp');
    final _email = _tempBox.get('email');
    value['email'] = _email;

    await forgotRepository
        .requestReset(value)
        .then((_) => _tempBox
            .deleteFromDisk()
            .whenComplete(() => callback(const Success())))
        .catchError((error) => callback(Failure(error: error)));
  }
}
