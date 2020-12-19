import 'package:build_context/build_context.dart';
import 'package:eproperty/model/sales/kpr_status.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/not_a_summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildKprStatus extends StatelessWidget {
  const BuildKprStatus({this.kprStatus});

  final KprStatus kprStatus;

  @override
  Widget build(BuildContext context) {
    return BuildNotASummaryCard(
      title: Strings.kpr,
      child: SizedBox(
        width: context.mediaQuerySize.width,
        child: DataTable(
          headingRowHeight: 0.0,
          columns: const [
            DataColumn(label: SizedBox()),
            DataColumn(label: SizedBox()),
          ],
          rows: kprStatus.data.map(
            (data) {
              return DataRow(
                cells: [
                  DataCell(
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(data.name),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('${data.qty}'),
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
