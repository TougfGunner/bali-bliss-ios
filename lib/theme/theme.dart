import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class BaliBlissTheme {
  BaliBlissTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: BaliBlissColors.editorialCream,
        colorScheme: const ColorScheme.light(
          primary: BaliBlissColors.editorialBlack,
          secondary: BaliBlissColors.editorialGold,
          surface: BaliBlissColors.editorialIvory,
          background: BaliBlissColors.editorialCream,
          error: Color(0xFFEF4444),
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: BaliBlissColors.editorialCream,
          foregroundColor: BaliBlissColors.editorialBlack,
          elevation: 0,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: BaliBlissColors.editorialIvory,
          selectedItemColor: BaliBlissColors.editorialGold,
          unselectedItemColor: BaliBlissColors.editorialCharcoal,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
        cardTheme: CardTheme(
          color: BaliBlissColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: BaliBlissColors.lightGray,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      );
}
