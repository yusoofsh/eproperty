import 'package:auto_route/auto_route.dart';
import 'package:eproperty/model/finance/month_summary.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/summary_card.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:intl/intl.dart';

class BuildFinanceSummary extends StatelessWidget {
  const BuildFinanceSummary({
    @required this.debtPayments,
    @required this.dueCredit,
    @required this.outstandingRetention,
    @required this.retentionRealization,
  });

  final MonthSummary debtPayments;
  final MonthSummary dueCredit;
  final MonthSummary outstandingRetention;
  final MonthSummary retentionRealization;

  @override
  Widget build(BuildContext context) {
    String formatToIdr(double value) {
      return NumberFormat.currency(
        locale: 'id',
        name: 'Rp. ',
        decimalDigits: 0,
      ).format(value);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.margin16),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SummaryCard(
                color: Colors.blue,
                upperTitle: Strings.debtPayments,
                lowerFirstTitle: Strings.thisMonth,
                lowerFirstSubtitle: formatToIdr(
                  debtPayments.data.thisMonth,
                ),
              ),
              const SizedBox(width: Sizes.width4),
              SummaryCard(
                color: Colors.green,
                upperTitle: Strings.dueCredit,
                lowerFirstTitle: Strings.thisMonth,
                lowerFirstSubtitle: formatToIdr(
                  dueCredit.data.thisMonth,
                ),
              ),
              const SizedBox(width: Sizes.width4),
              SummaryCard(
                color: Colors.orange,
                upperTitle: Strings.outstandingRetention,
                lowerFirstTitle: Strings.thisMonth,
                lowerFirstSubtitle: formatToIdr(
                  outstandingRetention.data.thisMonth,
                ),
              ),
              const SizedBox(width: Sizes.width4),
              SummaryCard(
                color: Colors.red,
                upperTitle: Strings.retentionRealization,
                lowerFirstTitle: Strings.thisMonth,
                lowerFirstSubtitle: formatToIdr(
                  retentionRealization.data.thisMonth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
