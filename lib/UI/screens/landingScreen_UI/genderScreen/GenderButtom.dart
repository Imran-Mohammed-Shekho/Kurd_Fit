import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';

// ignore: camel_case_types
class buildButtom extends StatelessWidget {
  final VoidCallback ontap;
  final Color? color;
  final Gradient? gradient;

  final String text;
  final bool isTrue;
  const buildButtom({
    super.key,
    required this.ontap,
    required this.text,
    required this.isTrue,
    this.color,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        width: 350,
        height: 60,

        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (color == null && gradient == null)
                ? kwhite.withValues(alpha: 0.2)
                : color,
            gradient: gradient,
          ),

          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(color: kwhite, fontSize: 20),
                ),
              ),
              isTrue
                  ? Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios, color: kwhite),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
