// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';

class buildProgressTracker extends StatelessWidget {
  const buildProgressTracker({required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.black26,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: size.width * (1 / 4),
              height: 6,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kwhite,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.circle, color: kwhite),
              Icon(Icons.circle, color: Colors.grey),
              Icon(Icons.circle, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
