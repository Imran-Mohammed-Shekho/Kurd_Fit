import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class GreetingUser extends StatelessWidget {
  final String username;
  const GreetingUser({required this.username, super.key});

  gretingUser() {
    final int time = DateTime.now().hour;

    if (time < 12) {
      return "Good Morning $username 👋!";
    } else if (time < 17) {
      return "Good Afternoon $username 😎";
    } else {
      return "Good Evening $username 🌙";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TyperAnimatedText(
          gretingUser(),
          speed: Duration(milliseconds: 100),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 227, 227, 227),
          ),
        ),
      ],
    );
  }
}
