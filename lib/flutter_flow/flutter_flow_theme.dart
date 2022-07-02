// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color primaryBtnText;
  Color lineColor;

  TextStyle get title1 => GoogleFonts.openSans(
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.openSans(
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.openSans(
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.openSans(
        color: tertiaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle get subtitle2 => GoogleFonts.openSans(
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.openSans(
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.openSans(
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  TextStyle get bodyTextBackground => GoogleFonts.openSans(
        color: primaryColor,
        backgroundColor: secondaryBackground,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = Color.fromARGB(255, 115, 255, 115);
  Color secondaryColor = Color.fromRGBO(183, 214, 178, 1);
  Color tertiaryColor = Color.fromARGB(255, 182, 243, 172);
  Color alternate = Color.fromARGB(255, 212, 250, 199);
  Color primaryBackground = Color.fromARGB(255, 248, 255, 246);
  Color secondaryBackground = Color.fromARGB(255, 43, 47, 42);
  Color primaryText = Color.fromRGBO(8, 36, 6, 1);
  Color secondaryText = Color.fromARGB(255, 236, 241, 235);

  Color primaryBtnText = Color(0xFF082406);
  Color lineColor = Color.fromARGB(255, 248, 255, 246);
}

class DarkModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF257567);
  Color secondaryColor = const Color(0xFF2E4541);
  Color tertiaryColor = Color.fromARGB(255, 18, 54, 48);
  Color alternate = Color.fromARGB(255, 8, 23, 20);
  Color primaryBackground = const Color(0xFF1A1F24);
  Color secondaryBackground = const Color(0xFF101213);
  Color primaryText = const Color(0xFFCCDBD8);
  Color secondaryText = const Color(0xFFB0DFD6);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color.fromARGB(255, 4, 1, 24);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.openSans(
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
