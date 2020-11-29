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
    final isLoggedIn = await UserRepository().retrieveData(
      name: 'is_logged_in',
      value: false,
    ) as bool;

    if (isLoggedIn) {
      final hasCompany = await CompaniesRepository().retrieveData(
        name: 'company',
        value: '',
      ) as String;

      if (hasCompany.isNotEmpty) {
        context.navigator.replace('/dashboard');
      } else {
        context.navigator.replace('/filter');
      }
    } else {
      context.navigator.replace('/log-in');
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
