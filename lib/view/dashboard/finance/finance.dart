import 'package:eproperty/model/finance/collection_percentage.dart';
import 'package:eproperty/model/finance/hold_percentage.dart';
import 'package:eproperty/model/finance/month_summary.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/view/core/widget/custom_spaces.dart';
import 'package:eproperty/view/dashboard/finance/collection_percentage.dart';
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
          final finance = watch(financeDataProvider);

          return Column(
            children: [
              finance.when(
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
    final debtPayments = data[0] as MonthSummary;
    final dueCredit = data[1] as MonthSummary;
    final outstandingRetention = data[2] as MonthSummary;
    final retentionRealization = data[3] as MonthSummary;
    final collectionPercentage = data[4] as CollectionPercentage;
    final holdPercentage = data[5] as HoldPercentage;
    // final agingDebt = data[6] as AgingDebt;
    // final debtAcceptance = data[7] as DebtAcceptance;
    // final kprReception = data[8] as KprReception;

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuildFinanceSummary(
              debtPayments: debtPayments,
              dueCredit: dueCredit,
              outstandingRetention: outstandingRetention,
              retentionRealization: retentionRealization,
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
                  BuildCollectionPercentage(
                    collectionPercentage: collectionPercentage,
                    holdPercentage: holdPercentage,
                  ),
                  // const CustomSpaces(height: Sizes.height4),
                  // BuildSalesByYear(salesByYear: salesByYear),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
