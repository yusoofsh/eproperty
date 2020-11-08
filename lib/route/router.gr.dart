// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../view/auth/auth_view.dart';
import '../view/auth/login/log_in_view.dart';
import '../view/dashboard/dashboard_view.dart';

class Routes {
  static const String authView = '/';
  static const String logInView = '/log-in-view';
  static const String dashboardView = '/dashboard-view';
  static const all = <String>{
    authView,
    logInView,
    dashboardView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.logInView, page: LogInView),
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
    DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardView(),
        settings: data,
      );
    },
  };
}
