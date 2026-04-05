import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class BaliBlissTypography {
  BaliBlissTypography._();

  // Display — Playfair Display (matches web Canela/serif)
  static TextStyle display({
    double size = 36,
    Color color = BaliBlissColors.editorialBlack,
    FontWeight weight = FontWeight.w700,
    FontStyle style = FontStyle.normal,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.playfairDisplay(
        fontSize: size,
        fontWeight: weight,
        fontStyle: style,
        color: color,
        letterSpacing: letterSpacing ?? -0.5,
        height: height ?? 1.2,
      );

  // Sans — Montserrat (matches web sans)
  static TextStyle sans({
    double size = 15,
    Color color = BaliBlissColors.editorialCharcoal,
    FontWeight weight = FontWeight.w400,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.montserrat(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
        height: height ?? 1.5,
      );

  // Raleway — accent sans
  static TextStyle raleway({
    double size = 13,
    Color color = BaliBlissColors.editorialCharcoal,
    FontWeight weight = FontWeight.w400,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.raleway(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
        height: height ?? 1.5,
      );

  // Great Vibes — script/decorative
  static TextStyle script({
    double size = 36,
    Color color = BaliBlissColors.editorialGold,
    double? letterSpacing,
  }) =>
      GoogleFonts.greatVibes(
        fontSize: size,
        color: color,
        letterSpacing: letterSpacing,
        height: 1.1,
      );

  // Label — small uppercase tracking
  static TextStyle label({
    double size = 11,
    Color color = BaliBlissColors.editorialGold,
    double letterSpacing = 3.0,
  }) =>
      GoogleFonts.montserrat(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing,
        height: 1.4,
      );

  // Button text
  static TextStyle button({
    double size = 13,
    Color color = BaliBlissColors.editorialBlack,
    double letterSpacing = 1.5,
  }) =>
      GoogleFonts.montserrat(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing,
        height: 1.2,
      );
}
