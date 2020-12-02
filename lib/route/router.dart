import 'package:auto_route/auto_route_annotations.dart';
import 'package:eproperty/view/auth/auth_view.dart';
import 'package:eproperty/view/auth/forgot/forgot_view.dart';
import 'package:eproperty/view/auth/login/log_in_view.dart';
import 'package:eproperty/view/dashboard/dashboard_view.dart';
import 'package:eproperty/view/filter/filter_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      path: '/auth',
      page: AuthView,
      initial: true,
    ),
    MaterialRoute(
      path: '/log-in',
      page: LogInView,
    ),
    MaterialRoute(
      path: '/forgot',
      page: ForgotView,
    ),
    MaterialRoute(
      path: '/filter',
      page: FilterView,
    ),
    MaterialRoute(
      path: '/dashboard',
      page: DashboardView,
    ),
  ],
)
class $Router {}
