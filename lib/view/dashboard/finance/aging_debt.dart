import 'package:build_context/build_context.dart';
import 'package:eproperty/model/finance/aging_debt.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BuildAgingDebt extends StatelessWidget {
  const BuildAgingDebt({
    Key key,
    this.agingDebt,
  }) : super(key: key);

  final AgingDebt agingDebt;

  @override
  Widget build(BuildContext context) {
    final detail = agingDebt.data.detail;

    String formatToIdr(num value) {
      return context.read(dashboardProvider).formatToIdr(value);
    }

    return BuildNotASummaryCard(
      title: Strings.agingDebt,
      child: Column(
        children: [
          Text(
            formatToIdr(agingDebt.data.total),
            style: context.textTheme.subtitle1,
          ),
          const SizedBox(height: Sizes.height8),
          Column(
            children: [
              percentage(
                context,
                percent: detail[0].percent.toDouble(),
                name: detail[0].name,
                value: formatToIdr(detail[0].value),
              ),
              const SizedBox(height: Sizes.height2),
              percentage(
                context,
                percent: detail[1].percent.toDouble(),
                name: detail[1].name,
                value: formatToIdr(detail[1].value),
              ),
              const SizedBox(height: Sizes.height2),
              percentage(
                context,
                percent: detail[2].percent.toDouble(),
                name: detail[2].name,
                value: formatToIdr(detail[2].value),
              ),
              const SizedBox(height: Sizes.height2),
              percentage(
                context,
                percent: detail[3].percent.toDouble(),
                name: detail[3].name,
                value: formatToIdr(detail[3].value),
              ),
              const SizedBox(height: Sizes.height2),
            ],
          ),
        ],
      ),
    );
  }

  Widget percentage(
    BuildContext context, {
    double percent,
    String name,
    String value,
  }) {
    Widget text(
      String data, {
      double leadingPaddingSize,
      double trailingPaddingSize,
      TextAlign textAlign,
    }) {
      return Padding(
        padding: EdgeInsets.only(
          left: trailingPaddingSize ?? 0.0,
          right: leadingPaddingSize ?? 0.0,
        ),
        child: Text(
          data ?? Strings.noData,
          textAlign: textAlign,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: context.mediaQuerySize.width * 0.176,
          child: text(
            '$name ${Strings.day}',
            textAlign: TextAlign.end,
            leadingPaddingSize: Sizes.padding8,
          ),
        ),
        const SizedBox(width: Sizes.width2),
        Expanded(
          child: LinearPercentIndicator(
            animation: true,
            percent: percent / 100 ?? 0.0,
            lineHeight: Sizes.size24,
            center: Text('${percent.toInt()}%'),
            progressColor: Colors.orange,
            backgroundColor: Colors.orange.withOpacity(.2),
            linearStrokeCap: LinearStrokeCap.roundAll,
          ),
        ),
        const SizedBox(width: Sizes.width2),
        text(
          value,
          textAlign: TextAlign.end,
          trailingPaddingSize: Sizes.padding8,
        ),
      ],
    );
  }
}
