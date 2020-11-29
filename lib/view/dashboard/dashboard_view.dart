import 'package:eproperty/model/sales_model.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider = FutureProvider<List<SalesModel>>(
  (_) async {
    final _response = DashboardViewModel().populateData();

    return _response;
  },
);

class DashboardView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final sales = watch(viewModelProvider);

    return Scaffold(
      body: Center(
        child: sales.when(
          data: (data) => Text(data.toString()),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}
