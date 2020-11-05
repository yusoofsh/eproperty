import 'package:auto_route/auto_route_annotations.dart';
import 'package:eproperty/screens/login_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    //Login Screens
    MaterialRoute(
      page: LoginScreen,
      initial: true,
    ),
  ],
)
class $Router {}
