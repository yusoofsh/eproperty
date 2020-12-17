import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/model/sales/cancel_status.dart';
import 'package:eproperty/model/sales/mail_order.dart';
import 'package:eproperty/model/sales/reservation.dart';
import 'package:eproperty/model/sales/unit_status.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/core/widget/custom_spaces.dart';
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.margin16),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              SummaryCard(
                color: Colors.blue,
                title: Strings.reservation,
                titleNumber: reservation.data.asOf,
                firstSubtitle: Strings.thisMonth,
                firstSubtitleNumber: reservation.data.bulanIni,
                secondSubtitle: Strings.cancelTotal,
                secondSubtitleNumber: reservation.data.batal,
              ),
              const CustomSpaces(width: Sizes.width4),
              SummaryCard(
                color: Colors.green,
                title: Strings.mailOrder,
                titleNumber: mailOrder.data.asOf,
                firstSubtitle: Strings.thisMonth,
                firstSubtitleNumber: mailOrder.data.bulanIni,
                secondSubtitle: Strings.lastMonth,
                secondSubtitleNumber: mailOrder.data.bulanLalu,
              ),
              const CustomSpaces(width: Sizes.width4),
              SummaryCard(
                color: Colors.orange,
                title: Strings.stock,
                titleNumber: unitStatus.data.statusAll,
                firstSubtitle: Strings.available,
                firstSubtitleNumber: unitStatus.data.statusA,
                secondSubtitle: Strings.sold,
                secondSubtitleNumber: unitStatus.data.statusB,
                thirdSubtitle: Strings.hold,
                thirdSubtitleNumber: unitStatus.data.statusH,
              ),
              const CustomSpaces(width: Sizes.width4),
              SummaryCard(
                color: Colors.red,
                title: Strings.cancel,
                titleNumber: cancelStatus.data.asOf,
                firstSubtitle: Strings.thisMonth,
                firstSubtitleNumber: cancelStatus.data.bulanIni,
                secondSubtitle: Strings.lastMonth,
                secondSubtitleNumber: cancelStatus.data.bulanLalu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    @required this.color,
    @required this.title,
    @required this.titleNumber,
    @required this.firstSubtitle,
    @required this.firstSubtitleNumber,
    @required this.secondSubtitle,
    @required this.secondSubtitleNumber,
    this.thirdSubtitle,
    this.thirdSubtitleNumber,
  });

  final Color color;
  final String title;
  final int titleNumber;
  final String firstSubtitle;
  final int firstSubtitleNumber;
  final String secondSubtitle;
  final int secondSubtitleNumber;
  final String thirdSubtitle;
  final int thirdSubtitleNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaQuerySize.width * 0.6,
      height: context.mediaQuerySize.height * 0.15,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.padding8,
            horizontal: Sizes.padding24,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: context.textTheme.headline6.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '$titleNumber',
                    style: context.textTheme.subtitle2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        firstSubtitle,
                        style: context.textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$firstSubtitleNumber',
                        style: context.textTheme.bodyText2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        secondSubtitle,
                        style: context.textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$secondSubtitleNumber',
                        style: context.textTheme.bodyText2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  if (thirdSubtitle != null) const Spacer(),
                  if (thirdSubtitleNumber != null)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          thirdSubtitle,
                          style: context.textTheme.bodyText1.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$thirdSubtitleNumber',
                          style: context.textTheme.bodyText2.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
