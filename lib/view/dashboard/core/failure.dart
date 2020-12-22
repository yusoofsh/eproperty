import 'package:build_context/build_context.dart';
import 'package:eproperty/value/strings.dart';
import 'package:flutter/material.dart';

class BuildFailure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset(
              'asset/image/not_found.png',
              alignment: Alignment.topCenter,
              height: context.mediaQuerySize.height / 1.6,
            ),
            Text(
              Strings.sorry,
              textAlign: TextAlign.center,
              style: context.textTheme.subtitle1,
            ),
            Text(Strings.notFound,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyText2),
          ],
        ),
      ),
    );
  }
}
