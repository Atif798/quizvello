import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Brand colors
  static const Color primaryColor = Color(0xFFEC4899);
  static const Color primaryDark = Color(0xFFBE185D);
  static const Color primaryLight = Color(0xFFF472B6);

  // Background and surfaces
  static const Color backgroundColor = Color(0xFFFFF5FA);
  static const Color surfaceColor = Colors.white;
  static const Color softPink = Color(0xFFFCE7F3);

  // Text colors
  static const Color textPrimaryColor = Color(0xFF2B0F1E);
  static const Color textSecondaryColor = Color(0xFF8A6B7C);
  static const Color textHintColor = Color(0xFFB39AA8);

  // Border colors
  static const Color borderColor = Color(0xFFF9C2DD);
  static const Color borderAccentColor = Color(0xFFF5A3C7);

  // Common colors
  static const Color onPrimaryColor = Colors.white;
  static const Color white = Colors.white;
  static const Color errorColor = Color(0xFFEF4444);

  // BUTTON STATE COLORS
  static const Color disabledBackgroundColor = Color(0xFFF3F0F4);
  static const Color disabledContentColor = Color(0xFF9999A9);

  // ANSWER FEEDBACK COLORS
  static const Color correctColor = Color(0xFF10B981);
  static const Color correctBackgroundColor = Color(0xFFE7F9F1);
  static const Color correctBorderColor = Color(0xFFA7E6C9);

  static const Color incorrectColor = Color(0xFFEF4444);
  static const Color incorrectBackgroundColor = Color(0xFFFDECEC);
  static const Color incorrectBorderColor = Color(0xFFF5B5B5);

  // RESULT SCREEN COLORS

  static const Color warningColor = Color(0xFFE69B27);
  static const Color warningBackgroundColor = Color(0xFFFFF5E6);

  // FONT FAMILY AND TEXT THEME

  static TextTheme get textTheme {
    return GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: textPrimaryColor,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: textPrimaryColor,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: textPrimaryColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textPrimaryColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textPrimaryColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textSecondaryColor,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textSecondaryColor,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: textSecondaryColor,
      ),
    );
  }

  // REUSABLE TEXT STYLES

  static TextStyle get appTitle => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: textPrimaryColor,
    letterSpacing: -0.5,
  );

  static TextStyle get heading => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: textPrimaryColor,
  );

  static TextStyle get sectionHeading => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: textPrimaryColor,
    letterSpacing: -0.2,
  );

  static TextStyle get body => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textSecondaryColor,
    height: 1.6,
  );

  static TextStyle get buttonText => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: onPrimaryColor,
    letterSpacing: 0.2,
  );

  static TextStyle get questionText => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: textPrimaryColor,
    height: 1.5,
  );

  static TextStyle get optionText => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textPrimaryColor,
    height: 1.4,
  );

  static TextStyle get caption => GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: textSecondaryColor,
  );

  static TextStyle get scoreText => GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: primaryDark,
  );

  // MATERIAL 3 THEME

  static ThemeData get lightTheme {
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
        ).copyWith(
          primary: primaryColor,
          onPrimary: onPrimaryColor,
          primaryContainer: softPink,
          onPrimaryContainer: primaryDark,
          secondary: primaryDark,
          surface: surfaceColor,
          onSurface: textPrimaryColor,
          onSurfaceVariant: textSecondaryColor,
          error: errorColor,
          outline: borderAccentColor,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      textTheme: textTheme,

      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: textPrimaryColor,
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: surfaceColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          elevation: 0,
          minimumSize: const Size(0, 52),
          textStyle: buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryDark,
          side: const BorderSide(color: borderAccentColor),
          minimumSize: const Size(0, 48),
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: softPink,
      ),

      dividerColor: borderColor,
      iconTheme: const IconThemeData(color: textPrimaryColor),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: textPrimaryColor,
        contentTextStyle: GoogleFonts.poppins(color: white, fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),

      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
