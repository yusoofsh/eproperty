import 'package:eproperty/model/accounting/cash_ratio.dart';
import 'package:eproperty/value/sizes.dart';
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

  Widget failure(Object error) => Center(child: Text('$error'));

  Widget loading() => const Center(child: CircularProgressIndicator());

  Widget success(List<dynamic> data) {
    final cashRatio = data[0] as Ratio;
    // final currentRatio = data[1] as Ratio;
    // final profit = data[2] as Profit;
    // final cashFlow = data[3] as CashFlow;
    // final debtPayments = data[4] as DebtPayments;
    // final debt = data[5] as Debt;

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
              Text(cashRatio.data.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
