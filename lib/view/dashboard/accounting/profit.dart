import 'package:eproperty/model/accounting/profit.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildProfit extends StatelessWidget {
  const BuildProfit({
    Key key,
    @required this.profit,
  }) : super(key: key);

  final Profit profit;

  @override
  Widget build(BuildContext context) {
    String formatToIdr(num value) {
      return context.read(dashboardProvider).formatToIdr(value, name: '');
    }

    return BuildNotASummaryCard(
      title: Strings.profit,
      child: Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: DataTable(
            dividerThickness: 0.4,
            showCheckboxColumn: false,
            columns: const [
              DataColumn(label: SizedBox()),
              DataColumn(
                label: Text(
                  Strings.thisYear,
                  textAlign: TextAlign.center,
                ),
              ),
              DataColumn(
                label: Text(
                  Strings.lastYear,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            rows: profit.data.map(
              (data) {
                return DataRow(
                  cells: [
                    DataCell(
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data.name,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        child: Text(
                          formatToIdr(data.current),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        child: Text(
                          formatToIdr(data.last),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
