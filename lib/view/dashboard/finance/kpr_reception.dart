import 'package:build_context/build_context.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:eproperty/model/finance/kpr_reception.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildKprReception extends StatelessWidget {
  const BuildKprReception({
    Key key,
    this.kprReception,
  }) : super(key: key);

  final KprReception kprReception;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Datum, int>> kprReceptionData() {
      return [
        charts.Series<Datum, int>(
          id: 'Target',
          data: kprReception.data,
          measureFn: (debt, _) => debt.target,
          domainFn: (debt, _) => debt.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.blue),
          areaColorFn: (_, index) {
            return charts.ColorUtil.fromDartColor(
              Colors.blue.withOpacity(.3),
            );
          },
        ),
        charts.Series<Datum, int>(
          id: 'Realisasi',
          data: kprReception.data,
          measureFn: (debt, _) => debt.realisasi,
          domainFn: (debt, _) => debt.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.orange),
          areaColorFn: (_, index) {
            return charts.ColorUtil.fromDartColor(
              Colors.orange.withOpacity(.3),
            );
          },
        ),
        charts.Series<Datum, int>(
          id: 'Persen',
          data: kprReception.data,
          measureFn: (debt, _) => debt.percent,
          domainFn: (debt, _) => debt.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.green),
          areaColorFn: (_, index) {
            return charts.ColorUtil.fromDartColor(
              Colors.green.withOpacity(.3),
            );
          },
        )..setAttribute(charts.rendererIdKey, 'KPR Reception Percentage'),
      ];
    }

    return BuildNotASummaryCard(
      title: Strings.kprReception,
      child: SizedBox(
        height: context.mediaQuerySize.height * 0.20,
        child: charts.LineChart(
          kprReceptionData(),
          animate: true,
          primaryMeasureAxis: const charts.NumericAxisSpec(
            tickProviderSpec:
                charts.BasicNumericTickProviderSpec(desiredTickCount: 6),
          ),
          defaultRenderer: charts.LineRendererConfig(
            includeArea: true,
            stacked: true,
          ),
          customSeriesRenderers: [
            charts.LineRendererConfig(
              customRendererId: 'KPR Reception Percentage',
            )
          ],
          behaviors: [
            charts.SlidingViewport(
              charts.SelectionModelType.action,
            ),
            charts.PanBehavior(),
            charts.SeriesLegend(
              outsideJustification: charts.OutsideJustification.middle,
              cellPadding: const EdgeInsets.only(
                left: Sizes.padding36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
