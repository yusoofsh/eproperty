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
import 'package:eproperty/view/core/widget/custom_spaces.dart';
import 'package:eproperty/view/dashboard/widget/aging_reservation.dart';
import 'package:eproperty/view/dashboard/widget/cancel_reason.dart';
import 'package:eproperty/view/dashboard/widget/kpr_status.dart';
import 'package:eproperty/view/dashboard/widget/legal_unit_status.dart';
import 'package:eproperty/view/dashboard/widget/sales.dart';
import 'package:eproperty/view/dashboard/widget/sales_as_of.dart';
import 'package:eproperty/view/dashboard/widget/sales_by_payment.dart';
import 'package:eproperty/view/dashboard/widget/sales_summary.dart';
import 'package:eproperty/view/dashboard/widget/top_sales.dart';
import 'package:eproperty/view/dashboard/widget/unit_stock_per_type.dart';
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
    final company = watch(companyProvider);

    return SafeArea(
      child: Column(
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
                  onPressed: () => context.navigator.push(Routes.filterView),
                ),
              ],
            ),
          ),
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
    final _topSales = data[4] as TopSales;
    final _sales = data[5] as Sales;
    final _salesAsOf = data[6] as SalesAsOf;
    final _salesByPayment = data[7] as SalesByPayment;
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
                  BuildSales(sales: _sales),
                  const CustomSpaces(height: Sizes.height4),
                  BuildSalesAsOf(salesAsOf: _salesAsOf),
                  const CustomSpaces(height: Sizes.height4),
                  BuildSalesByPayment(salesByPayment: _salesByPayment),
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
