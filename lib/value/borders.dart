import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart' hide Colors;

class Borders {
  static const InputBorder defaultBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 0.0,
      style: BorderStyle.none,
    ),
  );

  static BorderSide customBorder({
    Color color = Colors.black12,
    double width = Sizes.WIDTH_1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return BorderSide(
      color: color,
      width: width,
      style: style,
    );
  }

  static const BorderSide defaultPrimaryBorder =
      BorderSide(width: Sizes.WIDTH_0, style: BorderStyle.none);

  static const UnderlineInputBorder noBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  );

  static OutlineInputBorder customOutlineInputBorder({
    double borderRadius = Sizes.RADIUS_12,
    Color color = Colors.primaryColor,
    double width = Sizes.WIDTH_1,
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
    Color color = Colors.primaryColor,
    double width = Sizes.WIDTH_1,
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
      width: Sizes.WIDTH_2,
    ),
  );
}
