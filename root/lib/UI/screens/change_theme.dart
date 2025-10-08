import 'package:flutter/material.dart';
import 'package:gym/UI/screens/custom_colors.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black.withOpacity(0.1),
  extensions: [
    CustomColors(
      ButtonFrombottomNavigationbar: Colors.black,
      drawerbg: Color(0xff181a65),
      bottomNavigationBarBg: Color(0xff0011FF).withOpacity(0.5),
      TextFrombottomNavigationbar: Colors.black,
    ),
  ],
  colorScheme: ColorScheme.dark(
    background: Colors.black,

    surface: Colors.black.withOpacity(0.1),
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
      drawerbg: Colors.deepPurpleAccent.shade100,
      bottomNavigationBarBg: Color(0xff0011FF).withOpacity(0.3),
      TextFrombottomNavigationbar: Colors.black,
    ),
  ],
  colorScheme: ColorScheme.light(
    background: Colors.white,

    surface: Colors.white.withOpacity(0.1),
    onSurface: Colors.black,
    onBackground: Colors.black,
    primary: Color(0xff727bff),
  ),
);
