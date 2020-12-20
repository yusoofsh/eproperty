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
                    SizedBox(width: context.mediaQuerySize.width * 0.2),
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
