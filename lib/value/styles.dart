import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle customTextStyle({
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_14,
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
    double fontSize = Sizes.TEXT_SIZE_16,
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
