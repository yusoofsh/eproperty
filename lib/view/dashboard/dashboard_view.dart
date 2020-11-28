import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider = Provider<DashboardViewModel>(
  (_) => DashboardViewModel(),
);

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardViewModel crp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    crp = context.read(viewModelProvider);

    crp.populateData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('test')));
  }
}
