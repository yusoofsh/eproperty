import 'package:eproperty/model/accounting/cash_flow.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildCashFlow extends StatelessWidget {
  const BuildCashFlow({
    Key key,
    @required this.cashFlow,
  }) : super(key: key);

  final CashFlow cashFlow;

  @override
  Widget build(BuildContext context) {
    String formatToIdr(num value) {
      return context.read(dashboardProvider).formatToIdr(value);
    }

    return BuildNotASummaryCard(
      title: Strings.cashFlow,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: DataTable(
          dividerThickness: 0.4,
          headingRowHeight: 0.0,
          showCheckboxColumn: false,
          columns: const [
            DataColumn(label: SizedBox()),
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
                  const DataCell(SizedBox(width: Sizes.size4)),
                  DataCell(
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(formatToIdr(data.value)),
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
