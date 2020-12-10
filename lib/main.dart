import 'package:auto_route/auto_route.dart';
import 'package:eproperty/helper/easy_loading_helper.dart';
import 'package:eproperty/helper/hive_helper.dart';
import 'package:eproperty/helper/provider_helper.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/value/themes.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> initialization() async {
  await HiveHelper().initialize();

  const EasyLoadingHelper().initialize();
}

Future<void> main() async {
  await initialization();

  runApp(
    ProviderScope(
      observers: [
        ObserveProvider(),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: Themes().lightThemeData,
      onGenerateRoute: Router(),
      builder: ExtendedNavigator.builder<Router>(
        router: Router(),
        initialRoute: Routes.splashView,
        builder: (_, navigator) => FlutterEasyLoading(child: navigator),
      ),
    );
  }
}
