import 'package:flutter/material.dart';
import 'package:gym/UI/screens/custom_colors.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  extensions: [CustomColors(drawerbg: Colors.deepPurpleAccent)],
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
  extensions: [CustomColors(drawerbg: Colors.deepPurpleAccent.shade100)],
  colorScheme: ColorScheme.light(
    background: Colors.white,

    surface: Colors.white.withOpacity(0.1),
    onBackground: Colors.black,
    primary: Color(0xff727bff),
  ),
);
