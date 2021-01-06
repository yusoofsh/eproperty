import 'package:auto_route/auto_route.dart';
import 'package:eproperty/model/sales/cancel_status.dart';
import 'package:eproperty/model/sales/mail_order.dart';
import 'package:eproperty/model/sales/reservation.dart';
import 'package:eproperty/model/sales/unit_status.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/dashboard/core/summary_card.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildSalesSummary extends StatelessWidget {
  const BuildSalesSummary({
    @required this.reservation,
    @required this.mailOrder,
    @required this.unitStatus,
    @required this.cancelStatus,
  });

  final Reservation reservation;
  final MailOrder mailOrder;
  final UnitStatus unitStatus;
  final CancelStatus cancelStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.margin16),
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SummaryCard(
              color: Colors.blue,
              upperTitle: Strings.reservation,
              upperSubtitle: reservation.data.asOf.toString(),
              lowerFirstTitle: Strings.thisMonth,
              lowerFirstSubtitle: reservation.data.bulanIni.toString(),
              lowerSecondTitle: Strings.cancelTotal,
              lowerSecondSubtitle: reservation.data.batal.toString(),
            ),
            const SizedBox(height: Sizes.height4),
            SummaryCard(
              color: Colors.green,
              upperTitle: Strings.mailOrder,
              upperSubtitle: mailOrder.data.asOf.toString(),
              lowerFirstTitle: Strings.thisMonth,
              lowerFirstSubtitle: mailOrder.data.bulanIni.toString(),
              lowerSecondTitle: Strings.lastMonth,
              lowerSecondSubtitle: mailOrder.data.bulanLalu.toString(),
            ),
            const SizedBox(height: Sizes.height4),
            SummaryCard(
              color: Colors.orange,
              upperTitle: Strings.stock,
              upperSubtitle: unitStatus.data.statusAll.toString(),
              lowerFirstTitle: Strings.available,
              lowerFirstSubtitle: unitStatus.data.statusA.toString(),
              lowerSecondTitle: Strings.sold,
              lowerSecondSubtitle: unitStatus.data.statusB.toString(),
              lowerThirdTitle: Strings.hold,
              lowerThirdSubtitle: unitStatus.data.statusH.toString(),
            ),
            const SizedBox(height: Sizes.height4),
            SummaryCard(
              color: Colors.red,
              upperTitle: Strings.cancel,
              upperSubtitle: cancelStatus.data.asOf.toString(),
              lowerFirstTitle: Strings.thisMonth,
              lowerFirstSubtitle: cancelStatus.data.bulanIni.toString(),
              lowerSecondTitle: Strings.lastMonth,
              lowerSecondSubtitle: cancelStatus.data.bulanLalu.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
