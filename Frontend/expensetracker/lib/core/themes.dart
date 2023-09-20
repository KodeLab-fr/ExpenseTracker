import 'package:flutter/material.dart';

class Palette {
  static const PRIMARY = Color(0xFF363f93);
  static const SECONDARY = Color(0xFF4d59c2);
  static const DUST_LIGTH = Colors.black38;
  static const DUST_DARK = Colors.black12;
  static const ERROR = Color(0xFFE57373);
  static const SUCCESS = Color(0xFF37a146);
  static const BLACK = Colors.black;
  static const WHITE = Colors.white;
  static const CLOUD_LIGHT = Colors.white70;
  static const COULD_DARK = Colors.white30;
  static const TRANSPARENT = Colors.transparent;
}

class Themes {
  final ligthTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      onSurface: Palette.BLACK,
      surface: Palette.BLACK,
      background: Palette.WHITE,
      primary: Palette.PRIMARY,
      secondary: Palette.SECONDARY,
      error: Palette.ERROR,
      onPrimary: Palette.WHITE,
      onSecondary: Palette.WHITE,
      onBackground: Palette.BLACK,
      onError: Palette.ERROR,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Palette.WHITE),
        backgroundColor: MaterialStateProperty.all(Palette.PRIMARY),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Palette.PRIMARY,
      unselectedItemColor: Palette.DUST_LIGTH,
    ),
    textTheme: const TextTheme(
      //* Display
      displayLarge: TextStyle(
        // !
        color: Palette.PRIMARY,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        // ? unused
        color: Palette.PRIMARY,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        // ? unused
        color: Palette.PRIMARY,
        fontSize: 16,
      ),
      //* Headline
      headlineLarge: TextStyle(
        // ? unused
        color: Palette.WHITE,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        // ? unused
        color: Palette.WHITE,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        // ? unused
        color: Palette.WHITE,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      //* Title
      titleLarge: TextStyle(
        // ? unused
        color: Palette.PRIMARY,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        // ! used
        color: Palette.WHITE,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        // ! used
        color: Palette.PRIMARY,
        fontSize: 20,
      ),
      //* Label
      labelLarge: TextStyle(
        // ? unused
        color: Palette.BLACK,
        fontSize: 30,
      ),
      labelMedium: TextStyle(
        // ? unused
        color: Palette.BLACK,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        // ? unused
        color: Palette.BLACK,
        fontSize: 16,
      ),
      //* Body
      bodyLarge: TextStyle(
        // ! used
        color: Palette.PRIMARY,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        // ! used
        color: Palette.BLACK,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        // ! used
        color: Palette.DUST_LIGTH,
        fontSize: 16,
      ),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      onSurface: Palette.WHITE,
      surface: Palette.WHITE,
      background: Palette.WHITE,
      primary: Palette.SECONDARY,
      secondary: Palette.SECONDARY,
      error: Palette.ERROR,
      onPrimary: Palette.BLACK,
      onSecondary: Palette.WHITE,
      onBackground: Palette.BLACK,
      onError: Palette.WHITE,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Palette.WHITE),
        backgroundColor: MaterialStateProperty.all(Palette.PRIMARY),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Palette.SECONDARY,
      unselectedItemColor: Palette.CLOUD_LIGHT,
    ),
    textTheme: const TextTheme(
      //* Display
      displayLarge: TextStyle(
        // !
        color: Palette.SECONDARY,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        // ? unused
        color: Palette.PRIMARY,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        // ? unused
        color: Palette.PRIMARY,
        fontSize: 16,
      ),
      //* Headline
      headlineLarge: TextStyle(
        // ? unused
        color: Palette.WHITE,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        // ? unused
        color: Palette.WHITE,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        // ? unused
        color: Palette.WHITE,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      //* Title
      titleLarge: TextStyle(
        // ? unused
        color: Palette.PRIMARY,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        // ! used
        color: Palette.WHITE,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        // ! used
        color: Palette.SECONDARY,
        fontSize: 20,
      ),
      //* Label
      labelLarge: TextStyle(
        // ? unused
        color: Palette.BLACK,
        fontSize: 30,
      ),
      labelMedium: TextStyle(
        // ? unused
        color: Palette.BLACK,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        // ? unused
        color: Palette.BLACK,
        fontSize: 16,
      ),
      //* Body
      bodyLarge: TextStyle(
        // ! used
        color: Palette.SECONDARY,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        // ! used
        color: Palette.WHITE,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        // ! used
        color: Palette.CLOUD_LIGHT,
        fontSize: 16,
      ),
    ),
  );
}
