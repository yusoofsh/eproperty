import 'package:build_context/build_context.dart';
import 'package:eproperty/model/accounting/debt_payments.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildDebtPayments extends StatelessWidget {
  const BuildDebtPayments({
    Key key,
    @required this.debtPayments,
  }) : super(key: key);

  final DebtPayments debtPayments;

  @override
  Widget build(BuildContext context) {
    return BuildNotASummaryCard(
      title: Strings.debtPayments,
      child: SizedBox(
        width: context.mediaQuerySize.width,
        child: DataTable(
          headingRowHeight: 0.0,
          columnSpacing: Sizes.size12,
          columns: const [
            DataColumn(label: SizedBox()),
            DataColumn(label: SizedBox()),
          ],
          rows: debtPayments.data.map(
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
