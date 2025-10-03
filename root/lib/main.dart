import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Introduction_screen.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Gym(),
    ),
  );
}

class Gym extends StatelessWidget {
  const Gym({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Introduction(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      themeMode: ThemeMode.system,
      title: "Gym app",
    );
  }
}
