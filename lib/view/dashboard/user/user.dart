import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildUser extends StatelessWidget {
  const BuildUser(
    this.user, {
    Key key,
  }) : super(key: key);

  final AsyncValue<List<String>> user;

  Widget failure(Object error) => Center(child: Text('$error'));

  Widget loading() => const Center(child: CircularProgressIndicator());

  Widget success(List<String> data) {
    return Text(data.first);
  }

  @override
  Widget build(BuildContext context) {
    return user.when(
      data: (data) => success(data),
      loading: () => loading(),
      error: (error, __) => failure(error),
    );
  }
}
