import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/repository/forgot_repository.dart';

class ForgotViewModel with ActionMixin {
  final repository = ForgotRepository();

  Future<void> requestForgot(Map<String, dynamic> body) async {
    callback(const Loading());

    final _mainBox = await DatabaseHelper().openBox('main');
    _mainBox.put('email', body['email']);

    await repository
        .requestForgot(body)
        .then((value) => callback(const Success()))
        .catchError((error) => callback(Failure(error: error)));
  }

  Future<void> requestReset(Map<String, dynamic> body) async {
    callback(const Loading());

    final _mainBox = await DatabaseHelper().openBox('main');
    final _email = _mainBox.get('email');

    body['email'] = _email;

    await repository
        .requestReset(body)
        .then((_) => callback(const Success()))
        .catchError((error) => callback(Failure(error: error)));
  }
}
