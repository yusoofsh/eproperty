import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/finance/finance.dart';
import 'package:eproperty/view/dashboard/sales/sales.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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

class BuildBody extends StatelessWidget {
  const BuildBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, watch, __) {
          final company = watch(currentCompanyProvider);
          final selectedIndex = watch(selectedIndexProvider).state;

          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(Sizes.margin16),
                child: Row(
                  children: [
                    company.when(
                      data: (data) => Text(
                        data,
                        style: context.textTheme.headline3,
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (error, _) => Text('$error'),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        FeatherIcons.filter,
                        size: Sizes.size32,
                        color: Colors.black,
                      ),
                      onPressed: () =>
                          context.navigator.push(Routes.filterView),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (_) {
                  switch (selectedIndex) {
                    case 0:
                      return const BuildSales();
                      break;
                    case 1:
                      return const BuildFinance();
                      break;
                    case 2:
                      return const Center(child: Text('2'));
                      break;
                    default:
                      return const Text('oops');
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

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
