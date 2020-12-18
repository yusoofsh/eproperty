import 'package:eproperty/model/finance/month_summary.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/view/core/widget/custom_spaces.dart';
import 'package:eproperty/view/dashboard/finance/finance_summary.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildFinance extends StatelessWidget {
  const BuildFinance({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (_, watch, __) {
          final sales = watch(financeDataProvider);

          return Column(
            children: [
              sales.when(
                data: (data) => success(data),
                loading: () => loading(),
                error: (error, __) => failure(error),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget failure(Object error) => Center(child: Text('$error'));

  Widget loading() => const Center(child: CircularProgressIndicator());

  Widget success(List<dynamic> data) {
    final _debtPayments = data[0] as MonthSummary;
    final _dueCredit = data[1] as MonthSummary;
    final _outstandingRetention = data[2] as MonthSummary;
    final _retentionRealization = data[3] as MonthSummary;

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuildFinanceSummary(
              debtPayments: _debtPayments,
              dueCredit: _dueCredit,
              outstandingRetention: _outstandingRetention,
              retentionRealization: _retentionRealization,
            ),
            const CustomSpaces(height: Sizes.height4),
            Container(
              margin: const EdgeInsets.only(
                right: Sizes.margin16,
                left: Sizes.margin16,
                bottom: Sizes.margin16,
              ),
              child: Column(
                children: [
                  // BuildTopSales(topSales: _topSales),
                  // const CustomSpaces(height: Sizes.height4),
                  // BuildSalesByYear(salesByYear: _salesByYear),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
