import 'package:auto_route/auto_route.dart';
import 'package:eproperty/routes/router.gr.dart';
import 'package:eproperty/services/locator_service.dart';
import 'package:eproperty/values/values.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  configureDependencies();

  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CustomStrings.APP_NAME,
      theme: CustomTheme.lightThemeData,
      builder: ExtendedNavigator<Router>(
        router: Router(),
        initialRoute: Routes.loginScreen,
      ),
    );
  }
}
