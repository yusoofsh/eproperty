import 'package:auto_route/auto_route.dart';
import 'package:eproperty/repository/user_repository.dart';
import 'package:flutter/material.dart' hide Colors;

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  Future<void> isTokenExist() async {
    final token = await UserRepository().store('get', name: 'token');
    if (token != null) {
      context.navigator.replace('/filter-view');
    } else {
      context.navigator.replace('/log-in-view');
    }
  }

  @override
  void initState() {
    super.initState();

    isTokenExist();
  }

  @override
  Widget build(_) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 240),
      ),
    );
  }
}
