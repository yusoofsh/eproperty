import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/accounting/accounting.dart';
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
    Widget avatar(
      String image, {
      double radius,
    }) {
      if (Uri.parse(image).isAbsolute) {
        return CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (_, image) {
            return CircleAvatar(
              radius: radius ?? Sizes.size20,
              backgroundImage: image,
            );
          },
          progressIndicatorBuilder: (_, __, progress) {
            return CircularProgressIndicator(
              value: progress.progress,
            );
          },
          errorWidget: (_, __, ___) {
            return const Icon(FeatherIcons.xCircle);
          },
        );
      } else {
        return CircleAvatar(
          radius: radius ?? Sizes.size20,
          child: Image.memory(
            base64Decode(image),
          ),
        );
      }
    }

    InkWell change({
      IconData icon,
      String title,
      Function() onTap,
    }) {
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.padding24),
          margin: const EdgeInsets.symmetric(vertical: Sizes.margin8),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black54,
              ),
              const SizedBox(width: Sizes.width20),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget dialog(List<String> data) {
      return SimpleDialog(
        contentPadding: EdgeInsets.zero,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  FeatherIcons.x,
                  color: Colors.black,
                ),
                onPressed: () => context.navigator.pop(),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: Sizes.padding4),
                child: TextButton.icon(
                  icon: const Icon(
                    FeatherIcons.logOut,
                    color: Colors.black,
                    size: Sizes.size20,
                  ),
                  label: const Text(
                    Strings.logOut,
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    context.read(dashboardProvider).logOut(context);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.padding12),
            child: Row(
              children: [
                avatar(data[2], radius: Sizes.size24),
                const SizedBox(width: Sizes.width8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[0],
                      style: context.textTheme.subtitle1,
                    ),
                    Text(data[1]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: Sizes.height8),
          const Divider(
            thickness: Sizes.height2,
            color: Colors.black12,
          ),
          change(
            icon: FeatherIcons.image,
            title: Strings.changeProfilePicture,
            onTap: () => context.read(dashboardProvider).changePhoto(),
          ),
          change(
            icon: FeatherIcons.key,
            title: Strings.changePassword,
            onTap: () => context.navigator.push(Routes.changeView),
          ),
          const Divider(
            thickness: Sizes.height2,
            color: Colors.black12,
          ),
          change(
            icon: FeatherIcons.filter,
            title: Strings.changePreference,
            onTap: () => context.navigator.push(Routes.filterView),
          ),
          const SizedBox(height: Sizes.height12),
        ],
      );
    }

    return SafeArea(
      child: Consumer(
        builder: (context, watch, __) {
          final index = watch(indexProvider).state;
          final company = watch(currentCompanyProvider);
          final sales = watch(salesDataProvider);
          final finance = watch(financeDataProvider);
          final accounting = watch(accountingDataProvider);
          final user = watch(userDataProvider);

          return Column(
            children: [
              if (index == 3)
                const SizedBox()
              else
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
                      user.when(
                        data: (data) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => dialog(data),
                              );
                            },
                            child: avatar(data[2]),
                          );
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (error, _) => Text('$error'),
                      ),
                    ],
                  ),
                ),
              Builder(
                builder: (_) {
                  switch (index) {
                    case 0:
                      return BuildSales(sales);
                      break;
                    case 1:
                      return BuildFinance(finance);
                      break;
                    case 2:
                      return BuildAccounting(accounting);
                    default:
                      return Text('oops $index');
                      break;
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
              final index = watch(indexProvider).state;

              return GNav(
                selectedIndex: index,
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
                    backgroundColor: Colors.blue.withOpacity(.1),
                  ),
                  GButton(
                    text: Strings.finance,
                    textColor: Colors.green,
                    icon: FeatherIcons.dollarSign,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.green,
                    backgroundColor: Colors.green.withOpacity(.1),
                  ),
                  GButton(
                    text: Strings.accounting,
                    textColor: Colors.orange,
                    icon: FeatherIcons.pieChart,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(.1),
                  ),
                ],
                onTabChange: (int index) {
                  context.read(indexProvider).state = index;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
