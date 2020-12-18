import 'package:eproperty/view/dashboard/core/body.dart';
import 'package:eproperty/view/dashboard/core/bottom_navigation_bar.dart';
import 'package:flutter/material.dart' hide Colors;

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: BuildBody(),
      bottomNavigationBar: BuildBottomNavigationBar(),
    );
  }
}
