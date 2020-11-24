// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Colors;

import '../view/auth/auth_view.dart';
import '../view/auth/forgot/forgot_final_view.dart';
import '../view/auth/forgot/forgot_initial_view.dart';
import '../view/auth/login/log_in_view.dart';
import '../view/dashboard/dashboard_view.dart';
import '../view/filter/filter_view.dart';

class Routes {
  static const String authView = '/';
  static const String logInView = '/log-in-view';
  static const String forgotInitialView = '/forgot-initial-view';
  static const String forgotFinalView = '/forgot-final-view';
  static const String filterView = '/filter-view';
  static const String dashboardView = '/dashboard-view';
  static const all = <String>{
    authView,
    logInView,
    forgotInitialView,
    forgotFinalView,
    filterView,
    dashboardView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.logInView, page: LogInView),
    RouteDef(Routes.forgotInitialView, page: ForgotInitialView),
    RouteDef(Routes.forgotFinalView, page: ForgotFinalView),
    RouteDef(Routes.filterView, page: FilterView),
    RouteDef(Routes.dashboardView, page: DashboardView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthView(),
        settings: data,
      );
    },
    LogInView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LogInView(),
        settings: data,
      );
    },
    ForgotInitialView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotInitialView(),
        settings: data,
      );
    },
    ForgotFinalView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotFinalView(),
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
