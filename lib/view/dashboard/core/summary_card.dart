import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:flutter/material.dart' hide Colors;

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    @required this.color,
    @required this.upperTitle,
    this.upperSubtitle,
    @required this.lowerFirstTitle,
    @required this.lowerFirstSubtitle,
    this.lowerSecondTitle,
    this.lowerSecondSubtitle,
    this.lowerThirdTitle,
    this.lowerThirdSubtitle,
  });

  final Color color;
  final String upperTitle;
  final String upperSubtitle;
  final String lowerFirstTitle;
  final String lowerFirstSubtitle;
  final String lowerSecondTitle;
  final String lowerSecondSubtitle;
  final String lowerThirdTitle;
  final String lowerThirdSubtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaQuerySize.width * 0.64,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.padding8,
            horizontal: Sizes.padding24,
          ),
          child: SizedBox(
            height: context.mediaQuerySize.height * 0.1284,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      upperTitle,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline6.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    if (upperSubtitle != null)
                      Text(
                        upperSubtitle,
                        textAlign: TextAlign.center,
                        style: context.textTheme.subtitle2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          lowerFirstTitle,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyText1.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          lowerFirstSubtitle,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyText2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (lowerSecondTitle != null) const Spacer(),
                    if (lowerSecondSubtitle != null)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            lowerSecondTitle,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyText1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            lowerSecondSubtitle,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    if (lowerThirdTitle != null) const Spacer(),
                    if (lowerThirdSubtitle != null)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            lowerThirdTitle,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyText1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            lowerThirdSubtitle,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
