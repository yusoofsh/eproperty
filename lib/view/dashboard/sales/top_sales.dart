import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:eproperty/model/sales/top_sales.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildTopSales extends StatelessWidget {
  const BuildTopSales({
    @required this.topSales,
  });

  final TopSales topSales;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Datum, String>> _topSalesData() {
      return [
        charts.Series<Datum, String>(
          id: 'Top Sales',
          data: topSales.data,
          measureFn: (sales, _) => sales.value,
          domainFn: (sales, _) => '${sales.name} / ${sales.jumlah}',
          colorFn: (_, index) => index.isEven
              ? charts.ColorUtil.fromDartColor(Colors.blue)
              : charts.ColorUtil.fromDartColor(Colors.orange),
        )
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
                Strings.topSales,
                style: context.textTheme.headline6.copyWith(
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: context.mediaQuerySize.width * 0.72,
                height: context.mediaQuerySize.height * 0.16,
                child: charts.BarChart(
                  _topSalesData(),
                  animate: true,
                  vertical: false,
                  behaviors: [
                    charts.SlidingViewport(
                      charts.SelectionModelType.action,
                    ),
                    charts.PanBehavior(),
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
