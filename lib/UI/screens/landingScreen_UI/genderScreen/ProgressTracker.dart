// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

class buildProgressTracker extends StatelessWidget {
  const buildProgressTracker({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LandingscreenProvider>(context, listen: true);
    double getWidth() {
      final current = provider.currentindex; // 0 to 11
      final totalSteps = 11;
      return (size.width / 2) * (current / totalSteps);
    }

    return SizedBox(
      width: size.width / 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 5,
              width: size.width / 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kwhite.withOpacity(0.2),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: getWidth(),
              height: 6,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kwhite,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 16),
                Icon(Icons.check_circle, color: Colors.green, size: 16),
                Icon(Icons.check_circle, color: Colors.green, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
