import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:eproperty/model/sales/sales_by_payment.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildSalesByMonth extends StatelessWidget {
  const BuildSalesByMonth({
    @required this.salesByMonth,
  });

  final SalesByPayment salesByMonth;

  @override
  Widget build(BuildContext context) {
    charts.Color chartsColor(int index) {
      if (index == 0) {
        return charts.ColorUtil.fromDartColor(Colors.blue);
      } else if (index == 1) {
        return charts.ColorUtil.fromDartColor(Colors.orange);
      } else {
        return charts.ColorUtil.fromDartColor(Colors.green);
      }
    }

    List<charts.Series<Datum, String>> salesByPaymentData() {
      return [
        charts.Series<Datum, String>(
          id: 'Sales By Payment',
          data: salesByMonth.data,
          measureFn: (sales, _) => sales.value,
          domainFn: (sales, _) => sales.name,
          labelAccessorFn: (row, _) => '${row.unit}',
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
                Strings.paymentMethod,
                style: context.textTheme.headline6.copyWith(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: Sizes.height8),
              SizedBox(
                height: context.mediaQuerySize.height * 0.2,
                child: charts.PieChart(
                  salesByPaymentData(),
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                    arcWidth: Sizes.width12.toInt(),
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(),
                    ],
                  ),
                  behaviors: [
                    charts.DatumLegend(
                      position: charts.BehaviorPosition.end,
                      outsideJustification:
                          charts.OutsideJustification.endDrawArea,
                      horizontalFirst: false,
                      desiredMaxRows: 3,
                      cellPadding: const EdgeInsets.only(
                        right: Sizes.size12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
