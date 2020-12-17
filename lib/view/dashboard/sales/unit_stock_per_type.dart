import 'package:build_context/build_context.dart';
import 'package:eproperty/model/sales/unit_stock_per_type.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/core/widget/custom_spaces.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildUnitStockPerType extends StatelessWidget {
  const BuildUnitStockPerType({this.unitStockPerType});

  final UnitStockPerType unitStockPerType;

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
                Strings.unitStockPerType,
                style: context.textTheme.headline6.copyWith(
                  color: Colors.blue,
                ),
              ),
              const CustomSpaces(height: Sizes.height8),
              DataTable(
                columnSpacing: context.mediaQuerySize.width * 0.08,
                columns: const [
                  DataColumn(label: SizedBox()),
                  DataColumn(
                    label: Text(
                      Strings.unitStock,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      Strings.unitSold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      Strings.unitRemain,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                rows: unitStockPerType.data.map(
                  (data) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(data.type),
                          ),
                        ),
                        DataCell(
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('${data.stock}'),
                          ),
                        ),
                        DataCell(
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('${data.sold}'),
                          ),
                        ),
                        DataCell(
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('${data.remain}'),
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
              const CustomSpaces(height: Sizes.height8),
            ],
          ),
        ),
      ),
    );
  }
}
