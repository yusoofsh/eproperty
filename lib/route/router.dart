import 'package:auto_route/auto_route_annotations.dart';
import 'package:eproperty/view/auth/auth_view.dart';
import 'package:eproperty/view/auth/login/log_in_view.dart';
import 'package:eproperty/view/dashboard/dashboard_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: AuthView,
      initial: true,
    ),
    MaterialRoute(
      page: LogInView,
    ),
    MaterialRoute(
      page: DashboardView,
    ),
  ],
)
class $Router {}
