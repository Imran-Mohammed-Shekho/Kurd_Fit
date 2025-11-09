import 'package:flutter/material.dart';
import 'package:gym/UI/screens/about_UI/custom_colors.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black12.withValues(alpha: 0.1),
  extensions: [
    CustomColors(
      ButtonFrombottomNavigationbar: Colors.black,
      drawerbg: Color(0xff181a65).withValues(alpha: 0.1),
      bottomNavigationBarBg: Color(0xff0011FF).withValues(alpha: 0.1),
      TextFrombottomNavigationbar: Colors.black,
    ),
  ],
  colorScheme: ColorScheme.dark(
    surface: Colors.black.withValues(alpha: 0.1),
    onSurface: Colors.white,
    primary: Color.fromARGB(255, 63, 68, 147),
  ),
);

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  extensions: [
    CustomColors(
      ButtonFrombottomNavigationbar: Colors.black,
      drawerbg: Colors.white.withValues(alpha: 0.1),
      bottomNavigationBarBg: Color(0xff0011FF).withValues(alpha: 0.3),
      TextFrombottomNavigationbar: Colors.black,
    ),
  ],
  colorScheme: ColorScheme.light(
    surface: Colors.white.withValues(alpha: 0.06),
    onSurface: Colors.black,
    primary: Color(0xff727bff),
  ),
);
