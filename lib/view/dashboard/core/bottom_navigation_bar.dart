import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  const BuildBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: Sizes.size24,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding16,
            vertical: Sizes.padding8,
          ),
          child: Consumer(
            builder: (_, watch, __) {
              final selectedIndex = watch(selectedIndexProvider).state;

              return GNav(
                selectedIndex: selectedIndex,
                curve: Curves.easeOutExpo,
                gap: Sizes.size8,
                iconSize: Sizes.size24,
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                tabs: [
                  GButton(
                    text: Strings.sales,
                    textColor: Colors.blue,
                    icon: FeatherIcons.barChart,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.blue,
                    backgroundColor: Colors.blue.withOpacity(.2),
                  ),
                  GButton(
                    text: Strings.finance,
                    textColor: Colors.orange,
                    icon: FeatherIcons.dollarSign,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(.2),
                  ),
                  GButton(
                    text: Strings.accounting,
                    textColor: Colors.green,
                    icon: FeatherIcons.search,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.green,
                    backgroundColor: Colors.green.withOpacity(.2),
                  ),
                ],
                onTabChange: (int index) {
                  if (selectedIndex < index) {
                    context.read(selectedIndexProvider).state++;
                  } else if (selectedIndex > index) {
                    context.read(selectedIndexProvider).state--;
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
