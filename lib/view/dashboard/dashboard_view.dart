import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/model/sales/cancel_status.dart';
import 'package:eproperty/model/sales/mail_order.dart';
import 'package:eproperty/model/sales/reservation.dart';
import 'package:eproperty/model/sales/unit_status.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildBody(),
    );
  }
}

class BuildBody extends ConsumerWidget {
  const BuildBody();

  @override
  Widget build(
    BuildContext context,
    ScopedReader watch,
  ) {
    final sales = watch(dataProvider);

    return SafeArea(
      child: Column(
        children: [
          sales.when(
            data: (data) => Success(data),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text('$error $stackTrace'),
          ),
        ],
      ),
    );
  }
}

class Success extends StatelessWidget {
  const Success(this.data);

  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    final _reservation = data[0] as Reservation;
    final _mailOrder = data[1] as MailOrder;
    final _unitStatus = data[2] as UnitStatus;
    final _cancelStatus = data[3] as CancelStatus;
    // final _topSales = data[4] as TopSales;
    // final _salesAsOf = data[5] as SalesAsOf;
    // final _salesByPayment = data[6] as SalesByPayment;
    // final _cancelReason = data[7] as CancelReason;
    // final _agingReservation = data[8] as AgingReservation;
    // final _unitStockPerType = data[9] as UnitStockPerType;
    // final _kprStatus = data[10] as KprStatus;
    // final _legalUnitStatus = data[11] as LegalUnitStatus;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(Sizes.margin16),
          child: Row(
            children: [
              Consumer(
                builder: (_, watch, __) {
                  final _company = watch(headerTextProvider);

                  return _company.when(
                    data: (data) => Text(
                      data,
                      style: context.textTheme.headline3,
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (error, _) => Text('$error'),
                  );
                },
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  FeatherIcons.filter,
                  size: Sizes.size32,
                  color: Colors.black,
                ),
                onPressed: () => context.navigator.push(Routes.filterView),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.all(Sizes.margin16),
            child: FittedBox(
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  SalesSummary(
                    color: Colors.blue,
                    title: Strings.reservation,
                    titleNumber: _reservation.data.asOf,
                    firstSubtitle: Strings.thisMonth,
                    firstSubtitleNumber: _reservation.data.bulanIni,
                    secondSubtitle: Strings.cancelTotal,
                    secondSubtitleNumber: _reservation.data.batal,
                  ),
                  SalesSummary(
                    color: Colors.green,
                    title: Strings.mailOrder,
                    titleNumber: _mailOrder.data.asOf,
                    firstSubtitle: Strings.thisMonth,
                    firstSubtitleNumber: _mailOrder.data.bulanIni,
                    secondSubtitle: Strings.lastMonth,
                    secondSubtitleNumber: _mailOrder.data.bulanLalu,
                  ),
                  SalesSummary(
                    color: Colors.orange,
                    title: Strings.stock,
                    titleNumber: _unitStatus.data.statusAll,
                    firstSubtitle: Strings.available,
                    firstSubtitleNumber: _unitStatus.data.statusA,
                    secondSubtitle: Strings.sold,
                    secondSubtitleNumber: _unitStatus.data.statusB,
                    thirdSubtitle: Strings.hold,
                    thirdSubtitleNumber: _unitStatus.data.statusH,
                  ),
                  SalesSummary(
                    color: Colors.red,
                    title: Strings.cancel,
                    titleNumber: _cancelStatus.data.asOf,
                    firstSubtitle: Strings.thisMonth,
                    firstSubtitleNumber: _cancelStatus.data.bulanIni,
                    secondSubtitle: Strings.lastMonth,
                    secondSubtitleNumber: _cancelStatus.data.bulanLalu,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SalesSummary extends StatelessWidget {
  const SalesSummary({
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
  final String firstSubtitle;
  final String secondSubtitle;
  final String thirdSubtitle;
  final int titleNumber;
  final int firstSubtitleNumber;
  final int secondSubtitleNumber;
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
