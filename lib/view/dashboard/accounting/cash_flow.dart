import 'package:build_context/build_context.dart';
import 'package:eproperty/model/accounting/cash_flow.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildCashFlow extends StatelessWidget {
  const BuildCashFlow({
    Key key,
    @required this.cashFlow,
  }) : super(key: key);

  final CashFlow cashFlow;

  @override
  Widget build(BuildContext context) {
    return BuildNotASummaryCard(
      title: Strings.cashFlow,
      child: SizedBox(
        width: context.mediaQuerySize.width,
        child: DataTable(
          headingRowHeight: 0.0,
          columnSpacing: Sizes.size12,
          columns: const [
            DataColumn(label: SizedBox()),
            DataColumn(label: SizedBox()),
          ],
          rows: cashFlow.data.map(
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
                      alignment: Alignment.centerRight,
                      child: Text('${data.value}'),
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
