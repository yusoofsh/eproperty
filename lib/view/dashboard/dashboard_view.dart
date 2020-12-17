import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/model/sales/aging_reservation.dart';
import 'package:eproperty/model/sales/cancel_reason.dart';
import 'package:eproperty/model/sales/cancel_status.dart';
import 'package:eproperty/model/sales/kpr_status.dart';
import 'package:eproperty/model/sales/legal_unit_status.dart';
import 'package:eproperty/model/sales/mail_order.dart';
import 'package:eproperty/model/sales/reservation.dart';
import 'package:eproperty/model/sales/sales.dart';
import 'package:eproperty/model/sales/sales_as_of.dart';
import 'package:eproperty/model/sales/sales_by_payment.dart';
import 'package:eproperty/model/sales/top_sales.dart';
import 'package:eproperty/model/sales/unit_status.dart';
import 'package:eproperty/model/sales/unit_stock_per_type.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/core/widget/custom_spaces.dart';
import 'package:eproperty/view/dashboard/sales/aging_reservation.dart';
import 'package:eproperty/view/dashboard/sales/cancel_reason.dart';
import 'package:eproperty/view/dashboard/sales/kpr_status.dart';
import 'package:eproperty/view/dashboard/sales/legal_unit_status.dart';
import 'package:eproperty/view/dashboard/sales/sales_as_of.dart';
import 'package:eproperty/view/dashboard/sales/sales_by_month.dart';
import 'package:eproperty/view/dashboard/sales/sales_by_year.dart';
import 'package:eproperty/view/dashboard/sales/sales_summary.dart';
import 'package:eproperty/view/dashboard/sales/top_sales.dart';
import 'package:eproperty/view/dashboard/sales/unit_stock_per_type.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: BuildBody(),
      bottomNavigationBar: BuildBottomNavigationBar(),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, watch, __) {
          final company = watch(companyProvider);
          final selectedIndex = watch(selectedIndexProvider).state;

          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(Sizes.margin16),
                child: Row(
                  children: [
                    company.when(
                      data: (data) => Text(
                        data,
                        style: context.textTheme.headline3,
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (error, _) => Text('$error'),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        FeatherIcons.filter,
                        size: Sizes.size32,
                        color: Colors.black,
                      ),
                      onPressed: () =>
                          context.navigator.push(Routes.filterView),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (_) {
                  switch (selectedIndex) {
                    case 0:
                      return const BuildSalesBody();
                      break;
                    case 1:
                      return const Center(child: Text('1'));
                      break;
                    case 2:
                      return const Center(child: Text('2'));
                      break;
                    default:
                      return const Text('oops');
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class BuildSalesBody extends StatelessWidget {
  const BuildSalesBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (_, watch, __) {
          final sales = watch(dataProvider);

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
    final _reservation = data[0] as Reservation;
    final _mailOrder = data[1] as MailOrder;
    final _unitStatus = data[2] as UnitStatus;
    final _cancelStatus = data[3] as CancelStatus;
    final _topSales = data[4] as TopSales;
    final _salesByYear = data[5] as Sales;
    final _salesAsOf = data[6] as SalesAsOf;
    final _salesByMonth = data[7] as SalesByPayment;
    final _cancelReason = data[8] as CancelReason;
    final _agingReservation = data[9] as AgingReservation;
    final _unitStockPerType = data[10] as UnitStockPerType;
    final _kprStatus = data[11] as KprStatus;
    final _legalUnitStatus = data[12] as LegalUnitStatus;

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuildSalesSummary(
              reservation: _reservation,
              mailOrder: _mailOrder,
              unitStatus: _unitStatus,
              cancelStatus: _cancelStatus,
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
                  BuildTopSales(topSales: _topSales),
                  const CustomSpaces(height: Sizes.height4),
                  BuildSalesByYear(salesByYear: _salesByYear),
                  const CustomSpaces(height: Sizes.height4),
                  BuildSalesAsOf(salesAsOf: _salesAsOf),
                  const CustomSpaces(height: Sizes.height4),
                  BuildSalesByMonth(salesByMonth: _salesByMonth),
                  const CustomSpaces(height: Sizes.height4),
                  BuildCancelReason(cancelReason: _cancelReason),
                  const CustomSpaces(height: Sizes.height4),
                  BuildAgingReservation(agingReservation: _agingReservation),
                  const CustomSpaces(height: Sizes.height4),
                  BuildUnitStockPerType(unitStockPerType: _unitStockPerType),
                  const CustomSpaces(height: Sizes.height4),
                  BuildKprStatus(kprStatus: _kprStatus),
                  const CustomSpaces(height: Sizes.height4),
                  BuildLegalUnitStatus(legalUnitStatus: _legalUnitStatus),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildBottomNavigationBar extends StatelessWidget {
  const BuildBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: Sizes.size24,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding16,
            vertical: Sizes.padding8,
          ),
          child: Consumer(
            builder: (_, watch, __) {
              final selectedIndex = watch(selectedIndexProvider).state;

              return GNav(
                selectedIndex: selectedIndex,
                curve: Curves.easeOutExpo,
                gap: Sizes.size8,
                iconSize: Sizes.size24,
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                tabs: [
                  GButton(
                    text: Strings.sales,
                    textColor: Colors.blue,
                    icon: FeatherIcons.barChart,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.blue,
                    backgroundColor: Colors.blue.withOpacity(.2),
                  ),
                  GButton(
                    text: Strings.finance,
                    textColor: Colors.orange,
                    icon: FeatherIcons.dollarSign,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.orange,
                    backgroundColor: Colors.orange.withOpacity(.2),
                  ),
                  GButton(
                    text: Strings.accounting,
                    textColor: Colors.green,
                    icon: FeatherIcons.search,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.green,
                    backgroundColor: Colors.green.withOpacity(.2),
                  ),
                ],
                onTabChange: (int index) {
                  if (selectedIndex < index) {
                    context.read(selectedIndexProvider).state++;
                  } else if (selectedIndex > index) {
                    context.read(selectedIndexProvider).state--;
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
