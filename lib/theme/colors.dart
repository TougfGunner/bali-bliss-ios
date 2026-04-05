import 'package:flutter/material.dart';

class BaliBlissColors {
  BaliBlissColors._();

  // Editorial Core
  static const Color editorialBlack = Color(0xFF171717);
  static const Color editorialGold = Color(0xFFC9A84C);
  static const Color editorialCream = Color(0xFFF5F0EA);
  static const Color editorialIvory = Color(0xFFFDFAF6);
  static const Color editorialCharcoal = Color(0xFF333333);

  // Brand
  static const Color brandPrimary = Color(0xFF1F2937);
  static const Color brandSecondary = Color(0xFF6B7280);
  static const Color brandAccent = Color(0xFFC9A84C);

  // Wedding Themes
  static const Color blushPrimary = Color(0xFFF4C5C5);
  static const Color blushSecondary = Color(0xFFF9E0E0);
  static const Color blushText = Color(0xFF5C3A3A);

  static const Color sagePrimary = Color(0xFFC5D5C5);
  static const Color sageSecondary = Color(0xFFE0EDE0);
  static const Color sageText = Color(0xFF2E4A2E);

  static const Color lavenderPrimary = Color(0xFFD4BEED);
  static const Color lavenderSecondary = Color(0xFFEAE0F5);
  static const Color lavenderText = Color(0xFF3C2A5A);

  static const Color roseGoldPrimary = Color(0xFFF0C8B0);
  static const Color roseGoldSecondary = Color(0xFFF8E4D8);
  static const Color roseGoldText = Color(0xFF5A3020);

  static const Color mintPrimary = Color(0xFFB0DDD4);
  static const Color mintSecondary = Color(0xFFD8F0EC);
  static const Color mintText = Color(0xFF1A4A42);

  // UI
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFFAFAFA);
  static const Color lightGray = Color(0xFFF3F4F6);
  static const Color mediumGray = Color(0xFF9CA3AF);
  static const Color darkGray = Color(0xFF374151);
  static const Color border = Color(0xFFE5E7EB);

  // Gradients
  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF1F2937), Color(0xFF3D4F63)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [Color(0xFFF9E8E8), Color(0xFFFDF0E8), Color(0xFFFDFAF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFD4A849), Color(0xFFC9A84C), Color(0xFFB8962F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient profileGradient = const LinearGradient(
    colors: [Color(0xFF1F2937), Color(0xFF374151)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadows
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> elevatedShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
}
