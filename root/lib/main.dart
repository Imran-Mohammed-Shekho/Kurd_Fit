import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Introduction_screen.dart';

void main() {
  runApp(Gym());
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
