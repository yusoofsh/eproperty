import 'package:build_context/build_context.dart';
import 'package:eproperty/model/accounting/profit.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildProfit extends StatelessWidget {
  const BuildProfit({
    Key key,
    @required this.profit,
  }) : super(key: key);

  final Profit profit;

  @override
  Widget build(BuildContext context) {
    return BuildNotASummaryCard(
      title: Strings.profit,
      child: SizedBox(
        width: context.mediaQuerySize.width,
        child: DataTable(
          columnSpacing: Sizes.size12,
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
                      child: Text('${data.current}'),
                    ),
                  ),
                  DataCell(
                    Align(
                      child: Text('${data.last}'),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
