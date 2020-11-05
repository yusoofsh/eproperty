import 'package:eproperty/values/values.dart';
import 'package:flutter/material.dart';

import 'custom_spaces.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.title,
    this.onPressed,
    this.height = CustomSizes.HEIGHT_50,
    this.elevation = CustomSizes.ELEVATION_1,
    this.borderRadius = CustomSizes.RADIUS_24,
    this.color = Colors.black12,
    this.borderSide = CustomBorders.defaultPrimaryBorder,
    this.textStyle,
    this.icon,
    this.hasIcon = false,
  });

  final VoidCallback onPressed;

  final double height;
  final double elevation;
  final double borderRadius;
  final String title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle textStyle;
  final Widget icon;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderSide,
      ),
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (hasIcon) icon else const SizedBox(),
          if (hasIcon) const CustomSpaces(width: 8) else const SizedBox(),
          if (title != null)
            Text(
              title.toUpperCase(),
              style: textStyle,
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
