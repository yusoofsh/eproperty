import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle customTextStyle({
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.textSize14,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle2({
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.textSize16,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
