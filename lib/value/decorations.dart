import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart' hide Colors;

class Decorations {
  static BoxDecoration customBoxDecoration({
    double blurRadius = 5,
  }) {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: blurRadius,
          color: Colors.white70,
        )
      ],
    );
  }
}
