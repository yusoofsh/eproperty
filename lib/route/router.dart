import 'package:auto_route/auto_route_annotations.dart';
import 'package:eproperty/view/auth/auth_view.dart';
import 'package:eproperty/view/auth/forgot/forgot_final_view.dart';
import 'package:eproperty/view/auth/forgot/forgot_initial_view.dart';
import 'package:eproperty/view/auth/login/log_in_view.dart';
import 'package:eproperty/view/dashboard/dashboard_view.dart';
import 'package:eproperty/view/filter/filter_view.dart';

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
      page: ForgotInitialView,
    ),
    MaterialRoute(
      page: ForgotFinalView,
    ),
    MaterialRoute(
      page: FilterView,
    ),
    MaterialRoute(
      page: DashboardView,
    ),
  ],
)
class $Router {}
