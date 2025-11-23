import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/LevelScreen.dart';

class Reusableicon extends StatelessWidget {
  final IconData icondata;
  const Reusableicon({super.key, required this.icondata});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.25,
        height: size.width * 0.25,
        decoration: BoxDecoration(
          color: kwhite.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icondata, size: 100, color: kwhite.withValues(alpha: 0.8)),
      ),
    );
  }
}
