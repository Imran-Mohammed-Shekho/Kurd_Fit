import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/introduction_screen1.dart';

class buildButtom extends StatelessWidget {
  const buildButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Introduction1()),
          (route) => false,
        );
      },
      child: SizedBox(
        width: 350,
        height: 50,

        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 146, 146, 146),
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            color: kwhite.withOpacity(0.2),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Next",
                  style: TextStyle(color: kwhite, fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_forward_ios, color: kwhite),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
