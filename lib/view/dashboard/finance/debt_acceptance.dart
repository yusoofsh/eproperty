import 'package:build_context/build_context.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:eproperty/model/finance/debt_acceptance.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildDebtAcceptance extends StatelessWidget {
  const BuildDebtAcceptance({
    Key key,
    this.debtAcceptance,
  }) : super(key: key);

  final DebtAcceptance debtAcceptance;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Datum, int>> debtAcceptanceData() {
      return [
        charts.Series<Datum, int>(
          id: 'Target',
          data: debtAcceptance.data,
          measureFn: (debt, _) => debt.target,
          domainFn: (debt, _) => debt.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.blue),
        ),
        charts.Series<Datum, int>(
          id: 'Realisasi',
          data: debtAcceptance.data,
          measureFn: (debt, _) => debt.realisasi,
          domainFn: (debt, _) => debt.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.orange),
        ),
        charts.Series<Datum, int>(
          id: 'Persen',
          data: debtAcceptance.data,
          measureFn: (debt, _) => debt.percent,
          domainFn: (debt, _) => debt.month,
          colorFn: (_, index) => charts.ColorUtil.fromDartColor(Colors.green),
        )..setAttribute(charts.rendererIdKey, 'Debt Acceptance Percentage'),
      ];
    }

    return BuildNotASummaryCard(
      title: Strings.debtAcceptance,
      child: SizedBox(
        height: context.mediaQuerySize.height * 0.20,
        child: charts.NumericComboChart(
          debtAcceptanceData(),
          animate: true,
          primaryMeasureAxis: const charts.NumericAxisSpec(
            tickProviderSpec:
                charts.BasicNumericTickProviderSpec(desiredTickCount: 6),
          ),
          defaultRenderer: charts.BarRendererConfig(
            groupingType: charts.BarGroupingType.grouped,
          ),
          customSeriesRenderers: [
            charts.LineRendererConfig(
              customRendererId: 'Debt Acceptance Percentage',
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
