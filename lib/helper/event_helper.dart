import 'package:action_mixin/action_mixin.dart';

class Loading extends EventBase {
  const Loading();
}

class Success extends EventBase {
  const Success({this.message});

  final String message;
}

class Failure extends EventBase {
  const Failure({this.error});

  final dynamic error;
}

class Forgot extends EventBase {
  const Forgot();
}

class Dismiss extends EventBase {
  const Dismiss();
}
