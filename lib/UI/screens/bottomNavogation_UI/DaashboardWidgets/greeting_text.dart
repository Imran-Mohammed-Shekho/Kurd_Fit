import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/GoalScreen.dart';
import 'package:gym/l10n/app_localizations.dart';

// ignore: use_key_in_widget_constructors
class GreetingUser extends StatelessWidget {
  final String username;
  const GreetingUser({required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);
    gretingUser() {
      final int time = DateTime.now().hour;

      if (time < 12) {
        return " ${l10.goodMorning}$username 👋!";
      } else if (time < 17) {
        return "${l10.goodAfternoon} $username 😎";
      } else {
        return "${l10.goodEvening} $username 🌙";
      }
    }

    return AnimatedTextKit(
      totalRepeatCount: 3,
      animatedTexts: [
        TyperAnimatedText(
          gretingUser().toString().toUpperCase(),
          speed: Duration(milliseconds: 200),
          textStyle: TextStyle(fontWeight: FontWeight.bold, color: kwhite),
        ),
      ],
    );
  }
}
