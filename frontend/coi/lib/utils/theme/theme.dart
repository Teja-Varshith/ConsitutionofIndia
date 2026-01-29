import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // no instances, behave yourself

  // ---------- COLOR SCHEMES ----------

  static const _lightSeed = Color(0xFF111111);
  static const _darkSeed = Color(0xFFEDEDED);

  static final ColorScheme lightColorScheme =
      ColorScheme.fromSeed(
        seedColor: _lightSeed,
        brightness: Brightness.light,
        background: Colors.white,
        surface: Colors.white,
      );

  static final ColorScheme darkColorScheme =
      ColorScheme.fromSeed(
        seedColor: _darkSeed,
        brightness: Brightness.dark,
        background: Color(0xFF0F0F11),
        surface: Color(0xFF16161A),
      );

  // ---------- TEXT THEMES ----------

  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.black87,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.white70,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.white70,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  // ---------- THEMES ----------

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    colorScheme: lightColorScheme,
    textTheme: lightTextTheme,
    scaffoldBackgroundColor: lightColorScheme.background,

    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.surface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: lightTextTheme.titleLarge,
      iconTheme: IconThemeData(color: lightColorScheme.onSurface),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    colorScheme: darkColorScheme,
    textTheme: darkTextTheme,
    scaffoldBackgroundColor: darkColorScheme.background,

    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.surface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: darkTextTheme.titleLarge,
      iconTheme: IconThemeData(color: darkColorScheme.onSurface),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.primary,
        foregroundColor: darkColorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
      ),
    ),
  );
}
