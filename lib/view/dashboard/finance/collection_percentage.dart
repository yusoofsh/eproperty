import 'package:build_context/build_context.dart';
import 'package:eproperty/model/finance/collection_percentage.dart';
import 'package:eproperty/model/finance/hold_percentage.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/circular_percentage.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:percent_indicator/percent_indicator.dart';

class BuildCollectionPercentage extends StatelessWidget {
  const BuildCollectionPercentage({
    Key key,
    this.collectionPercentage,
    this.holdPercentage,
  }) : super(key: key);

  final CollectionPercentage collectionPercentage;
  final HoldPercentage holdPercentage;

  @override
  Widget build(BuildContext context) {
    final smoothness = collectionPercentage.data.lancar;
    final nonSmoothness = collectionPercentage.data.tidakLancar;
    final holdPercentageData = holdPercentage.data;

    double linearPercent() {
      if (smoothness > 999) {
        return smoothness.toDouble() / 10000;
      } else {
        return smoothness.toDouble() / 100;
      }
    }

    double circularPercent(int index) {
      if (holdPercentageData.isNotEmpty) {
        if (holdPercentageData.asMap().containsKey(index)) {
          return holdPercentageData[index].percent.toDouble();
        } else {
          return 0.0;
        }
      } else {
        return 0.0;
      }
    }

    String circularName(int index) {
      if (holdPercentageData.isNotEmpty) {
        if (holdPercentageData.asMap().containsKey(index)) {
          return holdPercentageData[index].name;
        } else {
          return Strings.noData;
        }
      } else {
        return Strings.noData;
      }
    }

    Widget text(
      String data, {
      double leadingPaddingSize,
      double trailingPaddingSize,
    }) {
      return Padding(
        padding: EdgeInsets.only(
          left: trailingPaddingSize ?? 0.0,
          right: leadingPaddingSize ?? 0.0,
        ),
        child: Text(
          data,
          textAlign: TextAlign.center,
        ),
      );
    }

    return BuildNotASummaryCard(
      title: Strings.collectionPercentage,
      child: Column(
        children: [
          SizedBox(
            width: context.mediaQuerySize.width * 0.8,
            child: LinearPercentIndicator(
              animation: true,
              percent: linearPercent(),
              lineHeight: Sizes.size24,
              progressColor: Colors.orange,
              backgroundColor: Colors.orange.withOpacity(.2),
              linearStrokeCap: LinearStrokeCap.roundAll,
              leading: text(
                '${Strings.smooth}\n$smoothness%',
                leadingPaddingSize: Sizes.padding8,
              ),
              trailing: text(
                '${Strings.notSmooth}\n$nonSmoothness%',
                trailingPaddingSize: Sizes.padding8,
              ),
            ),
          ),
          const SizedBox(height: Sizes.height4),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.mediaQuerySize.width * 0.2,
            ),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          Text(
            Strings.delayReasons,
            textAlign: TextAlign.center,
            style: context.textTheme.subtitle1.copyWith(
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: Sizes.height4),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              BuildCircularPercentage(
                percent: circularPercent(0),
                footer: circularName(0),
              ),
              const SizedBox(width: Sizes.width8),
              BuildCircularPercentage(
                percent: circularPercent(1),
                footer: circularName(1),
              ),
              const SizedBox(width: Sizes.width8),
              BuildCircularPercentage(
                percent: circularPercent(2),
                footer: circularName(2),
              ),
              const SizedBox(width: Sizes.width8),
              BuildCircularPercentage(
                percent: circularPercent(3),
                footer: circularName(3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
