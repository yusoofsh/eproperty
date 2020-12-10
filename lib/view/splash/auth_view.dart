import 'package:auto_route/auto_route.dart';
import 'package:eproperty/repository/companies_repository.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:flutter/material.dart' hide Colors;

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> configureDefaultRoute() async {
    final isLoggedIn = await UserRepository().retrieveData<bool>(
      name: 'is_logged_in',
      value: false,
    );

    if (isLoggedIn) {
      final hasCompany = await CompaniesRepository().retrieveData<String>(
        name: 'company',
        value: '',
      );

      if (hasCompany.isNotEmpty) {
        context.navigator.replace(Routes.dashboardView);
      } else {
        context.navigator.replace(Routes.filterView);
      }
    } else {
      context.navigator.replace(Routes.logInView);
    }
  }

  @override
  void initState() {
    super.initState();

    configureDefaultRoute();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 240),
      ),
    );
  }
}
