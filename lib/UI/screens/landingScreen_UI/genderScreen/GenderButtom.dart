import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';

// ignore: camel_case_types
class buildButtom extends StatelessWidget {
  final VoidCallback ontap;

  final String text;
  final bool isTrue;
  const buildButtom({
    super.key,
    required this.ontap,
    required this.text,
    required this.isTrue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
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
                  text,
                  style: TextStyle(color: kwhite, fontSize: 24),
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
