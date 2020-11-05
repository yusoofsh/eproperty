import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';
import 'custom_sizes.dart';

class CustomStyles {
  static TextStyle customTextStyle({
    Color color = CustomColors.black87,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = CustomSizes.TEXT_SIZE_14,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle2({
    Color color = CustomColors.black87,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = CustomSizes.TEXT_SIZE_16,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
