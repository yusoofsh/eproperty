import 'package:build_context/build_context.dart';
import 'package:eproperty/model/sales/legal_unit_status.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildLegalUnitStatus extends StatelessWidget {
  const BuildLegalUnitStatus({this.legalUnitStatus});

  final LegalUnitStatus legalUnitStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaQuerySize.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.padding8,
            horizontal: Sizes.padding24,
          ),
          child: Column(
            children: [
              Text(
                Strings.legalUnitStatus,
                style: context.textTheme.headline6.copyWith(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: Sizes.height12),
              SingleChildScrollView(
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
                  rows: legalUnitStatus.data.map(
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
                            SizedBox(
                                width: context.mediaQuerySize.width * 0.36),
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
            ],
          ),
        ),
      ),
    );
  }
}
