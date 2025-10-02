import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Dashboard_Screen.dart';
import 'package:gym/UI/screens/Login_screen.dart';

class Nutitrion_Screen extends StatefulWidget {
  const Nutitrion_Screen({super.key});

  @override
  State<Nutitrion_Screen> createState() => _Nutitrion_ScreenState();
}

class _Nutitrion_ScreenState extends State<Nutitrion_Screen> {
  int? age = 0;
  String name = '';
  double? weight = 0;
  double? tall = 0;
  String gender = '';
  bool _showcard = false;

  void calculateresult() {
    setState(() {
      _showcard = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Nutrition Calculator",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Fill in the following details to get your\n             daily nutritaion paln.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        GlassyTextField("age", (value) {
                          setState(() {
                            age = int.tryParse(value);
                          });
                        }),
                        SizedBox(height: 15),
                        GlassyTextField("Gender", (value) {
                          setState(() {
                            gender = value;
                          });
                        }),
                        SizedBox(height: 15),
                        GlassyTextField("Weight", (value) {
                          setState(() {
                            weight = double.tryParse(value);
                          });
                        }),
                        SizedBox(height: 15),
                        GlassyTextField("Height", (value) {
                          setState(() {
                            tall = double.tryParse(value);
                          });
                        }),
                      ],
                    ),
                  ),

                  SizedBox(height: 100),

                  dashboradBottom(
                    () {
                      calculateresult();
                    },
                    "Calculate",
                    Colors.white,
                  ),
                  SizedBox(height: 10),

                  if (_showcard) (ResultCard()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ResultCard() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
      child: Container(
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.white.withOpacity(0.8), width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "your result ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.local_fire_department_rounded,
                    color: Colors.white,
                    size: 30,
                  ),

                  Text(
                    "2000 kcal ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.fitness_center_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    "proten 7000g ",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
