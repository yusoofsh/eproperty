import 'package:eproperty/model/accounting/cash_flow.dart';
import 'package:eproperty/model/accounting/cash_ratio.dart';
import 'package:eproperty/model/accounting/debt.dart';
import 'package:eproperty/model/accounting/debt_payments.dart';
import 'package:eproperty/model/accounting/profit.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/view/dashboard/accounting/cash_flow.dart';
import 'package:eproperty/view/dashboard/accounting/cash_ratio.dart';
import 'package:eproperty/view/dashboard/accounting/debt.dart';
import 'package:eproperty/view/dashboard/accounting/debt_payments.dart';
import 'package:eproperty/view/dashboard/accounting/profit.dart';
import 'package:eproperty/view/dashboard/core/failure.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildAccounting extends StatelessWidget {
  const BuildAccounting(
    this.accounting, {
    Key key,
  }) : super(key: key);

  final AsyncValue<List<dynamic>> accounting;

  @override
  Widget build(BuildContext context) {
    return accounting.when(
      data: (data) => success(data),
      loading: () => loading(),
      error: (error, __) => failure(error),
    );
  }

  Widget failure(_) => BuildFailure();

  Widget loading() => const Center(child: CircularProgressIndicator());

  Widget success(List<dynamic> data) {
    final cashRatio = data[0] as Ratio;
    final currentRatio = data[1] as Ratio;
    final profit = data[2] as Profit;
    final cashFlow = data[3] as CashFlow;
    final debtPayments = data[4] as DebtPayments;
    final debt = data[5] as Debt;

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(
            right: Sizes.margin16,
            left: Sizes.margin16,
            bottom: Sizes.margin16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildCashRatio(
                cashRatio: cashRatio,
                currentRatio: currentRatio,
              ),
              const SizedBox(height: Sizes.height4),
              BuildProfit(profit: profit),
              const SizedBox(height: Sizes.height4),
              BuildCashFlow(cashFlow: cashFlow),
              const SizedBox(height: Sizes.height4),
              BuildDebtPayments(debtPayments: debtPayments),
              const SizedBox(height: Sizes.height4),
              BuildDebt(debt: debt),
            ],
          ),
        ),
      ),
    );
  }
}
