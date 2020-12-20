import 'package:build_context/build_context.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:flutter/material.dart' hide Colors;

class BuildNotASummaryCard extends StatelessWidget {
  const BuildNotASummaryCard({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaQuerySize.width,
      child: Card(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: Sizes.padding8,
            horizontal: Sizes.padding12,
          ),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.headline6.copyWith(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: Sizes.height4),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
