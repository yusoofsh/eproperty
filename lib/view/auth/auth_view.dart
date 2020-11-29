import 'package:auto_route/auto_route.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/material.dart' hide Colors;

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  Future<void> configureDefaultRoute() async {
    final bool isLoggedIn = await UserRepository().retrieveData(
      name: 'is_logged_in',
      value: false,
    );

    if (isLoggedIn) {
      final String company = await CompaniesRepository().retrieveData(
        name: 'company',
        value: '',
      );

      if (company.isNotEmpty) {
        context.navigator.pushAndRemoveUntil(
          '/dashboard-view',
          (_) => false,
        );
      } else {
        context.navigator.pushAndRemoveUntil(
          '/filter-view',
          (_) => false,
        );
      }
    } else {
      context.navigator.pushAndRemoveUntil(
        '/log-in-view',
        (_) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    configureDefaultRoute();
  }

  @override
  Widget build(_) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 240),
      ),
    );
  }
}
