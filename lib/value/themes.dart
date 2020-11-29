import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static const Color lightFillColor = Colors.black;
  static final Color lightFocusColor = Colors.black.withOpacity(0.12);

  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFFF6673),
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: lightFillColor,
    onError: lightFillColor,
    onPrimary: lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_96,
      color: Colors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_60,
      color: Colors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_48,
      color: Colors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_34,
      color: Colors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_24,
      color: Colors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_20,
      color: Colors.black87,
      fontWeight: bold,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_16,
      color: Colors.black87,
      fontWeight: semiBold,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_14,
      color: Colors.black87,
      fontWeight: semiBold,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_16,
      color: Colors.black87,
      fontWeight: light,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_14,
      color: Colors.black87,
      fontWeight: light,
      fontStyle: FontStyle.normal,
    ),
    button: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_14,
      color: Colors.black87,
      fontStyle: FontStyle.normal,
      fontWeight: medium,
    ),
    caption: GoogleFonts.poppins(
      fontSize: Sizes.TEXT_SIZE_12,
      color: Colors.white,
      fontWeight: regular,
      fontStyle: FontStyle.normal,
    ),
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: Sizes.ELEVATION_8,
      primary: Colors.blue,
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
      ),
    ),
  );

  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
  ) {
    return ThemeData(
      accentColor: colorScheme.primary,
      canvasColor: colorScheme.background,
      colorScheme: colorScheme,
      elevatedButtonTheme: elevatedButtonTheme,
      buttonColor: Colors.blue,
      focusColor: Colors.primaryColor,
      highlightColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: textTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData lightThemeData = themeData(
    lightColorScheme,
    lightFocusColor,
  );
}
