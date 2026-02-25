import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color _hsl(double h, double s, double l){
    return HSLColor.fromAHSL(1.0, h, s/100, l/100).toColor();
  }

  static final Color bgDark = _hsl(208, 100, 2);
  static final Color primary = _hsl(196, 68, 64);

  static final Color text = _hsl(198, 100, 93);
  static final Color textMuted =_hsl(197, 42, 67);

  static final Color danger = _hsl(9, 31, 65);

  static final Color bgLight = _hsl(196, 73, 7);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bgDark,
      colorScheme: ColorScheme.dark(
        primary: primary,
        surface: bgLight,
        error: danger
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.poppins(
          color: text,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        bodyLarge: GoogleFonts.poppins(
          color: text,
          fontSize: 18
        ),
        bodyMedium: GoogleFonts.poppins(
          color: textMuted
        )
      )
    );
  }

}