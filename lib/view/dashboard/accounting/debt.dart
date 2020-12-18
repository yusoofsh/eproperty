import 'package:build_context/build_context.dart';
import 'package:eproperty/model/accounting/debt.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildDebt extends StatelessWidget {
  const BuildDebt({
    Key key,
    @required this.debt,
  }) : super(key: key);

  final Debt debt;

  @override
  Widget build(BuildContext context) {
    return BuildNotASummaryCard(
      title: Strings.debt,
      child: SizedBox(
        width: context.mediaQuerySize.width,
        child: DataTable(
          columnSpacing: Sizes.size12,
          columns: const [
            DataColumn(label: SizedBox()),
            DataColumn(label: SizedBox()),
          ],
          rows: debt.data.map(
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
