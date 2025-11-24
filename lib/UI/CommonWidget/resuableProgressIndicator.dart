import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/GoalScreen.dart';

class reusableProgressIndicator extends StatelessWidget {
  const reusableProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 7,
      color: kwhite,
      backgroundColor: kwhite.withValues(alpha: 0.4),
    );
  }
}
