import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Introduction_screen.dart';
import 'package:gym/UI/screens/change_theme.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Gym(),
    ),
  );
}

class Gym extends StatelessWidget {
  const Gym({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, providertheme, Widget? child) {
        return AnimatedTheme(
          data: ThemeData(),
          duration: Duration(seconds: 2),
          curve: Curves.linear,
          child: MaterialApp(
            home: Introduction(),
            debugShowCheckedModeBanner: false,
            themeMode: providertheme.themeMode,
            theme: lightmode,
            darkTheme: darkmode,

            title: "Gym app",
          ),
        );
      },
    );
  }
}
