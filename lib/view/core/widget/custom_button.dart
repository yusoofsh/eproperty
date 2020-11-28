import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart' hide Colors;

import 'custom_spaces.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    @required this.onPressed,
    @required this.theme,
    @required this.title,
    this.icon,
    Key key,
  }) : super(key: key);

  final String title;
  final ThemeData theme;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      elevation: Sizes.ELEVATION_8,
      height: Sizes.HEIGHT_40,
      minWidth: Sizes.WIDTH_120,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.RADIUS_24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon ?? const SizedBox(),
          if (icon != null) const CustomSpaces(width: 8) else const SizedBox(),
          if (title != null)
            Text(
              title.toUpperCase(),
              style: theme.textTheme.button.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
