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
import 'package:eproperty/value/sizes.dart';
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
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildSales extends StatelessWidget {
  const BuildSales(
    this.sales, {
    Key key,
  }) : super(key: key);

  final AsyncValue<List<dynamic>> sales;

  @override
  Widget build(BuildContext context) {
    return sales.when(
      data: (data) => success(data),
      loading: () => loading(),
      error: (error, __) => failure(error),
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
            const SizedBox(height: Sizes.height4),
            Container(
              margin: const EdgeInsets.only(
                right: Sizes.margin16,
                left: Sizes.margin16,
                bottom: Sizes.margin16,
              ),
              child: Column(
                children: [
                  BuildTopSales(topSales: _topSales),
                  const SizedBox(height: Sizes.height4),
                  BuildSalesByYear(salesByYear: _salesByYear),
                  const SizedBox(height: Sizes.height4),
                  BuildSalesAsOf(salesAsOf: _salesAsOf),
                  const SizedBox(height: Sizes.height4),
                  BuildSalesByMonth(salesByMonth: _salesByMonth),
                  const SizedBox(height: Sizes.height4),
                  BuildCancelReason(cancelReason: _cancelReason),
                  const SizedBox(height: Sizes.height4),
                  BuildAgingReservation(agingReservation: _agingReservation),
                  const SizedBox(height: Sizes.height4),
                  BuildUnitStockPerType(unitStockPerType: _unitStockPerType),
                  const SizedBox(height: Sizes.height4),
                  BuildKprStatus(kprStatus: _kprStatus),
                  const SizedBox(height: Sizes.height4),
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
