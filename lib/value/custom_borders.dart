import 'package:flutter/material.dart';

import 'custom_colors.dart';
import 'custom_sizes.dart';

class CustomBorders {
  static const InputBorder defaultBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 0.0,
      style: BorderStyle.none,
    ),
  );

  static BorderSide customBorder({
    Color color = Colors.black12,
    double width = CustomSizes.WIDTH_1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return BorderSide(
      color: color,
      width: width,
      style: style,
    );
  }

  static const BorderSide defaultPrimaryBorder =
      BorderSide(width: CustomSizes.WIDTH_0, style: BorderStyle.none);

  static const UnderlineInputBorder noBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  );

  static OutlineInputBorder customOutlineInputBorder({
    double borderRadius = CustomSizes.RADIUS_12,
    Color color = CustomColors.primaryColor,
    double width = CustomSizes.WIDTH_1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      borderSide: BorderSide(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  static UnderlineInputBorder customUnderlineInputBorder({
    Color color = CustomColors.primaryColor,
    double width = CustomSizes.WIDTH_1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  static const UnderlineInputBorder primaryInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  );

  static const UnderlineInputBorder disabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  static const UnderlineInputBorder enabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  );

  static const UnderlineInputBorder focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black54,
      width: CustomSizes.WIDTH_2,
    ),
  );
}
