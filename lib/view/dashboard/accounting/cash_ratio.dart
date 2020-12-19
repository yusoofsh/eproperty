import 'package:build_context/build_context.dart';
import 'package:eproperty/model/accounting/cash_ratio.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/circular_percentage.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildCashRatio extends StatelessWidget {
  const BuildCashRatio({
    Key key,
    @required this.cashRatio,
    @required this.currentRatio,
  }) : super(key: key);

  final Ratio cashRatio;
  final Ratio currentRatio;

  @override
  Widget build(BuildContext context) {
    return BuildNotASummaryCard(
      title: Strings.cashRatio,
      // TODO: wait API.
      child: Column(
        children: [
          BuildRatio(
            title: Strings.liquidityRatio,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
                const SizedBox(width: Sizes.width8),
                BuildCircularPercentage(
                  percent: currentRatio.data.toDouble(),
                  center: currentRatio.data.toString(),
                  footer: Strings.noData,
                ),
              ],
            ),
          ),
          BuildRatio(
            title: Strings.profitabilityRatio,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
                const SizedBox(width: Sizes.width8),
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
                const SizedBox(width: Sizes.width8),
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
                const SizedBox(width: Sizes.width8),
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
              ],
            ),
          ),
          BuildRatio(
            title: Strings.debtRatio,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
                const SizedBox(width: Sizes.width8),
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
                const SizedBox(width: Sizes.width8),
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
                const SizedBox(width: Sizes.width8),
                BuildCircularPercentage(
                  percent: cashRatio.data.toDouble(),
                  center: cashRatio.data.toString(),
                  footer: Strings.noData,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildRatio extends StatelessWidget {
  const BuildRatio({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.mediaQuerySize.width * 0.2,
          ),
          child: const Divider(
            color: Colors.grey,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.subtitle1.copyWith(
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: Sizes.height4),
        child,
      ],
    );
  }
}
