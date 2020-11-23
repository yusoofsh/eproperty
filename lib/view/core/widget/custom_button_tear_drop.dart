import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart';

import 'custom_painters.dart';

enum TearDropAlignment { topLeft, topRight, bottomLeft, bottomRight }

class TearDropButton extends StatelessWidget {
  const TearDropButton({
    @required this.buttonText,
    this.radius,
    this.tearDropAlignment = TearDropAlignment.topRight,
    this.buttonTextStyle,
    this.color = CustomColors.orange,
    this.style = PaintingStyle.fill,
    this.onTap,
    this.elevation = CustomSizes.ELEVATION_8,
    this.hasShadow = false,
    this.shadowColor,
  });

  final double radius;
  final Color color;
  final TearDropAlignment tearDropAlignment;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final PaintingStyle style;
  final GestureTapCallback onTap;
  final bool hasShadow;
  final double elevation;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    final double defaultRadius = assignHeight(
      context: context,
      fraction: 0.07,
    );
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: SizedBox(
        height: (defaultRadius ?? radius) * 2,
        width: (defaultRadius ?? radius) * 2,
        child: Stack(
          children: [
            SizedBox(
              height: (defaultRadius ?? radius) * 2,
              width: (defaultRadius ?? radius) * 2,
              child: CustomPaint(
                painter: DrawTearDrop(
                  color: color,
                  offset: Offset(
                    defaultRadius ?? radius,
                    defaultRadius ?? radius,
                  ),
                  elevation: elevation,
                  shadowColor: shadowColor,
                  hasShadow: hasShadow,
                  paintingStyle: style,
                  radius: defaultRadius ?? radius,
                  tearDropAlignment: tearDropAlignment,
                ),
              ),
            ),
            SizedBox(
              height: (defaultRadius ?? radius) * 2,
              width: (defaultRadius ?? radius) * 2,
              child: Center(
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: buttonTextStyle ??
                      theme.textTheme.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
