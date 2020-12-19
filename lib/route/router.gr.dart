// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../view/dashboard/dashboard_view.dart';
import '../view/filter/filter_view.dart';
import '../view/forgot/forgot_view.dart';
import '../view/login/log_in_view.dart';
import '../view/splash/auth_view.dart';

class Routes {
  static const String splashView = '/splash';
  static const String logInView = '/log-in';
  static const String forgotView = '/forgot';
  static const String filterView = '/filter';
  static const String dashboardView = '/dashboard';
  static const all = <String>{
    splashView,
    logInView,
    forgotView,
    filterView,
    dashboardView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.logInView, page: LogInView),
    RouteDef(Routes.forgotView, page: ForgotView),
    RouteDef(Routes.filterView, page: FilterView),
    RouteDef(Routes.dashboardView, page: DashboardView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    LogInView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LogInView(),
        settings: data,
      );
    },
    ForgotView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotView(),
        settings: data,
      );
    },
    FilterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FilterView(),
        settings: data,
      );
    },
    DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardView(),
        settings: data,
      );
    },
  };
}
