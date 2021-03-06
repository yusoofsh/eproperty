import 'package:build_context/build_context.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:eproperty/model/sales/aging_reservation.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildAgingReservation extends StatelessWidget {
  const BuildAgingReservation({
    Key key,
    this.agingReservation,
  }) : super(key: key);

  final AgingReservation agingReservation;

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

    List<charts.Series<Datum, String>> agingReservationData() {
      return [
        charts.Series<Datum, String>(
          id: 'Aging Reservation',
          data: agingReservation.data,
          measureFn: (sales, _) => sales.count,
          domainFn: (sales, _) => sales.name,
          labelAccessorFn: (row, _) => row.name,
          colorFn: (_, index) => chartsColor(index),
        ),
      ];
    }

    return BuildNotASummaryCard(
      title: Strings.agingReservation,
      child: SizedBox(
        width: context.mediaQuerySize.width * 0.72,
        height: context.mediaQuerySize.height * 0.16,
        child: charts.PieChart(
          agingReservationData(),
          animate: true,
          behaviors: [
            charts.DatumLegend(
              position: charts.BehaviorPosition.end,
              cellPadding: const EdgeInsets.only(
                left: Sizes.padding8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
