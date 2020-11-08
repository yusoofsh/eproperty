import 'package:action_mixin/action_mixin.dart';

class Loading extends EventBase {
  const Loading();
}

class Failure extends EventBase {
  Failure({this.error});

  final dynamic error;
}

class Success extends EventBase {
  const Success();
}
