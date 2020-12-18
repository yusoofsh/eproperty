import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/view/dashboard/sales/sales.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                      return const Center(child: Text('1'));
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
