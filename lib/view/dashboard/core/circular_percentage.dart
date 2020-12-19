import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:percent_indicator/percent_indicator.dart';

class BuildCircularPercentage extends StatelessWidget {
  const BuildCircularPercentage({
    Key key,
    @required this.percent,
    this.center,
    this.footer,
  }) : super(key: key);

  final double percent;
  final String center;
  final String footer;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: Sizes.size80,
      lineWidth: Sizes.size12,
      animation: true,
      percent: percent / 100,
      center: Text('$center%'),
      footer: Text(footer),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.orange,
      backgroundColor: Colors.orange.withOpacity(.2),
    );
  }
}
