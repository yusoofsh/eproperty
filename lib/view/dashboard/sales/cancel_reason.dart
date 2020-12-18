import 'package:build_context/build_context.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:eproperty/model/sales/cancel_reason.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildCancelReason extends StatelessWidget {
  const BuildCancelReason({
    this.cancelReason,
  });

  final CancelReason cancelReason;

  @override
  Widget build(BuildContext context) {
    charts.Color chartsColor(int index) {
      if (index == 0) {
        return charts.ColorUtil.fromDartColor(Colors.blue);
      } else if (index == 1) {
        return charts.ColorUtil.fromDartColor(Colors.orange);
      } else if (index == 2) {
        return charts.ColorUtil.fromDartColor(Colors.green);
      } else {
        return charts.ColorUtil.fromDartColor(Colors.yellow);
      }
    }

    List<charts.Series<Datum, String>> cancelReasonData() {
      return [
        charts.Series<Datum, String>(
          id: 'Cancel Reason',
          data: cancelReason.data,
          measureFn: (sales, _) => sales.unit,
          domainFn: (sales, _) {
            return (sales.name.isNotEmpty) ? sales.name : Strings.unknown;
          },
          labelAccessorFn: (sales, _) => sales.name,
          colorFn: (_, index) => chartsColor(index),
        ),
      ];
    }

    return SizedBox(
      width: context.mediaQuerySize.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.padding8,
            horizontal: Sizes.padding24,
          ),
          child: Column(
            children: [
              Text(
                Strings.cancelReason,
                style: context.textTheme.headline6.copyWith(
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: context.mediaQuerySize.width * 0.72,
                height: context.mediaQuerySize.height * 0.24,
                child: charts.PieChart(
                  cancelReasonData(),
                  animate: true,
                  behaviors: [
                    charts.DatumLegend(
                      desiredMaxColumns: 1,
                      position: charts.BehaviorPosition.bottom,
                      cellPadding: const EdgeInsets.only(
                        left: Sizes.padding8,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.height8),
            ],
          ),
        ),
      ),
    );
  }
}
