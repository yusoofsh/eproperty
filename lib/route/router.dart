import 'package:auto_route/auto_route_annotations.dart';
import 'package:eproperty/view/change/change_view.dart';
import 'package:eproperty/view/dashboard/dashboard_view.dart';
import 'package:eproperty/view/filter/filter_view.dart';
import 'package:eproperty/view/forgot/forgot_view.dart';
import 'package:eproperty/view/login/log_in_view.dart';
import 'package:eproperty/view/splash/splash_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      path: '/splash',
      page: SplashView,
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
    MaterialRoute(
      path: '/change',
      page: ChangeView,
      fullscreenDialog: true,
    ),
  ],
)
class $Router {}
