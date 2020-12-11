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
      child: Column(
        children: [
          sales.map(
            data: (data) => Text('$data'),
            loading: (_) => const CircularProgressIndicator(),
            error: (error) => Text('$error'),
          ),
          sales.when(
            data: (data) => Text('$data'),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('$error $stackTrace'),
          ),
        ],
      ),
    );
  }
}
