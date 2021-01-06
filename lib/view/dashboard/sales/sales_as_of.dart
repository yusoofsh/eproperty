import 'package:build_context/build_context.dart';
import 'package:eproperty/model/sales/sales_as_of.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildSalesAsOf extends StatelessWidget {
  const BuildSalesAsOf({
    @required this.salesAsOf,
  });

  final SalesAsOf salesAsOf;

  @override
  Widget build(BuildContext context) {
    String formatToIdr(num value) {
      return context.read(dashboardProvider).formatToIdr(value);
    }

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
                Strings.salesByThisMonth,
                style: context.textTheme.headline6.copyWith(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: Sizes.height8),
              SizedBox(
                width: context.mediaQuerySize.width * 0.8,
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(160.0),
                    1: FixedColumnWidth(64.0),
                    2: FixedColumnWidth(224.0),
                  },
                  children: [
                    const TableRow(
                      children: [
                        SizedBox(),
                        Text(
                          Strings.unit,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Strings.contractValue,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(salesAsOf.data[0].name),
                        Text('${salesAsOf.data[0].unit}'),
                        Text(formatToIdr(salesAsOf.data[0].value)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(salesAsOf.data[1].name),
                        Text('${salesAsOf.data[1].unit}'),
                        Text(formatToIdr(salesAsOf.data[1].value)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(salesAsOf.data[2].name),
                        Text('${salesAsOf.data[2].unit}'),
                        Text(formatToIdr(salesAsOf.data[2].value)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: Sizes.height8),
            ],
          ),
        ),
      ),
    );
  }
}
