import 'package:flutter/material.dart';
import 'package:gym/UI/screens/appTheme/custom_colors.dart';
import 'package:gym/UI/screens/landingScreen_UI/LevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/questionScreenControll.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black12.withValues(alpha: 0.1),
  extensions: [
    CustomColors(
      ButtonFrombottomNavigationbar: Colors.black,
      drawerbg: Color(0xff181a65).withValues(alpha: 0.1),
      bottomNavigationBarBg: Colors.black,
      TextFrombottomNavigationbar: Colors.black,
      buttomColor: LinearGradient(
        colors: [Color(0xFF6A5AE0), Color(0xFF8A73F5)],
      ),
    ),
  ],
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF121212),
    onSurface: kwhite,
    primary: kwhite.withValues(alpha: 0.1),
    secondary: kwhite.withValues(alpha: 0.1),
    onSecondary: kwhite,
  ),
);

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  extensions: [
    CustomColors(
      ButtonFrombottomNavigationbar: Colors.black,
      drawerbg: Colors.white.withValues(alpha: 0.1),
      bottomNavigationBarBg: backgroundColor,
      TextFrombottomNavigationbar: Colors.black,
      buttomColor: LinearGradient(
        colors: [kwhite.withValues(alpha: 0.2), kwhite.withValues(alpha: 0.2)],
      ),
    ),
  ],
  colorScheme: ColorScheme.light(
    surface: backgroundColor,
    onSurface: kwhite,
    primary: kwhite.withValues(alpha: 0.1),
    secondary: kwhite,
    onSecondary: const Color.from(alpha: 1, red: 0, green: 0, blue: 0),
  ),
);
