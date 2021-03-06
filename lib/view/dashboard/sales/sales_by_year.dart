import 'package:build_context/build_context.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:eproperty/model/sales/sales.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildSalesByYear extends StatelessWidget {
  const BuildSalesByYear({
    @required this.salesByYear,
  });

  final Sales salesByYear;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Datum, String>> salesByUnitData() {
      return [
        charts.Series<Datum, String>(
          id: 'Target',
          data: salesByYear.data,
          measureFn: (sales, _) => sales.targetValue,
          domainFn: (sales, _) => '${sales.month}',
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.blue),
        ),
        charts.Series<Datum, String>(
          id: 'Realisasi',
          data: salesByYear.data,
          measureFn: (sales, _) => sales.realisasiValue,
          domainFn: (sales, _) => '${sales.month}',
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.orange),
        ),
        charts.Series<Datum, String>(
          id: 'Persen',
          data: salesByYear.data,
          measureFn: (sales, _) => sales.percentValue,
          domainFn: (sales, _) => '${sales.month}',
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.green),
        )..setAttribute(
            charts.rendererIdKey,
            'Unit Percentage',
          ),
      ];
    }

    List<charts.Series<Datum, int>> salesByIdrData() {
      return [
        charts.Series<Datum, int>(
          id: 'Target',
          data: salesByYear.data,
          measureFn: (sales, _) => sales.targetQty,
          domainFn: (sales, _) => sales.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.blue),
        ),
        charts.Series<Datum, int>(
          id: 'Realisasi',
          data: salesByYear.data,
          measureFn: (sales, _) => sales.realisasiQty,
          domainFn: (sales, _) => sales.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.orange),
        ),
        charts.Series<Datum, int>(
          id: 'Persen',
          data: salesByYear.data,
          measureFn: (sales, _) => sales.percentQty,
          domainFn: (sales, _) => sales.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.green),
        ),
      ];
    }

    return Column(
      children: [
        BuildSalesByCard(
          salesByUnitData: salesByUnitData(),
          isUnit: true,
        ),
        const SizedBox(height: Sizes.height4),
        BuildSalesByCard(
          salesByIdrData: salesByIdrData(),
          isUnit: false,
        ),
      ],
    );
  }
}

class BuildSalesByCard extends StatelessWidget {
  const BuildSalesByCard({
    this.isUnit,
    this.salesByUnitData,
    this.salesByIdrData,
  });

  final bool isUnit;
  final List<charts.Series<Datum, String>> salesByUnitData;
  final List<charts.Series<Datum, int>> salesByIdrData;

  @override
  Widget build(BuildContext context) {
    String salesByTitle(int data) {
      if (isUnit) {
        return '${Strings.sales} $data ${Strings.by} ${Strings.unit}';
      } else {
        return '${Strings.sales} $data ${Strings.by} ${Strings.idr}';
      }
    }

    return SizedBox(
      width: context.mediaQuerySize.width,
      height: context.mediaQuerySize.height * 0.20,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.padding8,
            horizontal: Sizes.padding24,
          ),
          child: Column(
            children: [
              Consumer(
                builder: (_, watch, __) {
                  final year = watch(currentYearProvider);
                  return year.when(
                    data: (data) {
                      return Text(
                        salesByTitle(data),
                        style: context.textTheme.headline6.copyWith(
                          color: Colors.blue,
                        ),
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, _) => Text('$error'),
                  );
                },
              ),
              const SizedBox(height: Sizes.height8),
              Expanded(
                child: isUnit
                    ? BuildSalesBarChart(salesByUnitData: salesByUnitData)
                    : BuildSalesLineChart(salesByIdrData: salesByIdrData),
              ),
              const SizedBox(height: Sizes.height8),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildSalesBarChart extends StatelessWidget {
  const BuildSalesBarChart({
    @required this.salesByUnitData,
  });

  final List<charts.Series<Datum, String>> salesByUnitData;

  @override
  Widget build(BuildContext context) {
    return charts.OrdinalComboChart(
      salesByUnitData,
      animate: true,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
      ),
      primaryMeasureAxis: const charts.NumericAxisSpec(
        tickProviderSpec:
            charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
      ),
      customSeriesRenderers: [
        charts.LineRendererConfig(
          customRendererId: 'Unit Percentage',
        )
      ],
      behaviors: [
        charts.SlidingViewport(
          charts.SelectionModelType.action,
        ),
        charts.PanBehavior(),
        charts.SeriesLegend(
          cellPadding: const EdgeInsets.only(
            left: Sizes.padding24,
          ),
        ),
      ],
    );
  }
}

class BuildSalesLineChart extends StatelessWidget {
  const BuildSalesLineChart({
    @required this.salesByIdrData,
  });

  final List<charts.Series<Datum, int>> salesByIdrData;

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      salesByIdrData,
      animate: true,
      primaryMeasureAxis: const charts.NumericAxisSpec(
        tickProviderSpec:
            charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
      ),
      behaviors: [
        charts.SlidingViewport(
          charts.SelectionModelType.action,
        ),
        charts.PanBehavior(),
        charts.SeriesLegend(
          cellPadding: const EdgeInsets.only(
            left: Sizes.padding24,
          ),
        ),
      ],
    );
  }
}
