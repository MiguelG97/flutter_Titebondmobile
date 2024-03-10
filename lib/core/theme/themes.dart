import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/theme/colors.dart';

class MThemes {
  MThemes._();
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.raleway(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: MColors.titleLarge,
      ),
      titleSmall: GoogleFonts.raleway(
          fontSize: 16, fontWeight: FontWeight.w500, color: MColors.titleSmall),
      headlineSmall: GoogleFonts.raleway(
        fontSize: 16,
        color: MColors.dark_100,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
