import 'package:build_context/build_context.dart';
import 'package:eproperty/model/sales/reservation.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/core/widget/custom_spaces.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends ConsumerWidget {
  const Body();

  @override
  Widget build(
    BuildContext context,
    ScopedReader watch,
  ) {
    final sales = watch(dataProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16),
        child: Column(
          children: [
            sales.when(
              data: (data) => Success(data),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Text('$error $stackTrace'),
            ),
          ],
        ),
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
    // final _mailOrder = data[1] as MailOrder;
    // final _unitStatus = data[2] as UnitStatus;
    // final _cancelStatus = data[3] as CancelStatus;
    // final _topSales = data[4] as TopSales;
    // final _salesAsOf = data[5] as SalesAsOf;
    // final _salesByPayment = data[6] as SalesByPayment;
    // final _cancelReason = data[7] as CancelReason;
    // final _agingReservation = data[8] as AgingReservation;
    // final _unitStockPerType = data[9] as UnitStockPerType;
    // final _kprStatus = data[10] as KprStatus;
    // final _legalUnitStatus = data[11] as LegalUnitStatus;

    return Column(
      children: [
        Row(
          children: [
            Card(
              color: Colors.blue,
              margin: const EdgeInsets.all(Sizes.margin8),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          Strings.reservation,
                          style: context.textTheme.headline6,
                        ),
                        const CustomSpaces(height: Sizes.height2),
                        Text(
                          Strings.active,
                          style: context.textTheme.subtitle1,
                        ),
                        const CustomSpaces(height: Sizes.height2),
                        Text(
                          '${_reservation.data.asOf}',
                          style: context.textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  const CustomSpaces(height: Sizes.height4),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            Strings.thisMonth,
                            style: context.textTheme.headline3,
                          ),
                          const CustomSpaces(height: Sizes.height2),
                          Text(
                            '${_reservation.data.bulanIni}',
                            style: context.textTheme.headline3,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            Strings.cancelTotal,
                            style: context.textTheme.headline3,
                          ),
                          const CustomSpaces(height: Sizes.height2),
                          Text(
                            '${_reservation.data.batal}',
                            style: context.textTheme.headline3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
