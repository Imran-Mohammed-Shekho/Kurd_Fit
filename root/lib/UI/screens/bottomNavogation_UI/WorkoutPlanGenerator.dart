import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';

class Workoutplangenerator extends StatefulWidget {
  const Workoutplangenerator({super.key});

  @override
  State<Workoutplangenerator> createState() => _WorkoutplangeneratorState();
}

class _WorkoutplangeneratorState extends State<Workoutplangenerator> {
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String Goal = "fat_loss";
  String Gender = "female";
  int daysPerWeek = 5;
  String experience = "beginner";
  bool isLoad = false;

  Future generatePlan() {
    setState(() {
      isLoad = true;
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
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "🔥 AI Workout Generator ",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              Form(
                child: Column(
                  children: [
                    _buildText("age"),
                    _buildTextFormfields(
                      controller: _ageController,
                      hintText: "age",
                    ),
                    _buildText("Height/Cm"),
                    _buildTextFormfields(
                      controller: _heightController,
                      hintText: "Height in cm",
                    ),
                    _buildText("Weight/Kg"),
                    _buildTextFormfields(
                      controller: _weightController,
                      hintText: "Weight in Kg",
                    ),

                    _buildText("Goal"),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                255,
                                255,
                                255,
                                1,
                              ).withOpacity(0.06),
                              border: Border.all(
                                color: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ).withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  barrierDismissible: true,
                                  dropdownColor: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                    color: Colors.white,
                                  ),

                                  elevation: 15,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                  value: Goal,
                                  items: [
                                    DropdownMenuItem(
                                      value: "fat_loss",
                                      child: Text("fat_loss"),
                                    ),
                                    DropdownMenuItem(
                                      value: "muscle_gain",
                                      child: Text("muscle_gain"),
                                    ),
                                    DropdownMenuItem(
                                      value: "strength",
                                      child: Text("strength"),
                                    ),
                                    DropdownMenuItem(
                                      value: "general_fitness",
                                      child: Text("general_fitness"),
                                    ),
                                  ],
                                  onChanged: (value) =>
                                      setState(() => Goal = value.toString()),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _buildText("Gender"),

                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                255,
                                255,
                                255,
                                1,
                              ).withOpacity(0.06),
                              border: Border.all(
                                color: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ).withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  barrierDismissible: true,
                                  dropdownColor: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                  ),

                                  elevation: 15,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                  value: Gender,
                                  items: [
                                    DropdownMenuItem(
                                      value: "male",
                                      child: Text("male"),
                                    ),
                                    DropdownMenuItem(
                                      value: "female",
                                      child: Text("female"),
                                    ),
                                  ],
                                  onChanged: (value) =>
                                      setState(() => Gender = value.toString()),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _buildText("Experience"),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                255,
                                255,
                                255,
                                1,
                              ).withOpacity(0.06),
                              border: Border.all(
                                color: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ).withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  barrierDismissible: true,
                                  dropdownColor: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                    color: const Color(0xFFFFFFFF),
                                  ),

                                  elevation: 15,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                  value: experience,
                                  items: [
                                    DropdownMenuItem(
                                      value: "beginner",
                                      child: Text("beginner"),
                                    ),
                                    DropdownMenuItem(
                                      value: "intermediate",
                                      child: Text("intermediate"),
                                    ),
                                    DropdownMenuItem(
                                      value: "advanced",
                                      child: Text("advanced"),
                                    ),
                                  ],
                                  onChanged: (value) => setState(
                                    () => experience = value.toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _buildText("How many days do you prefer?"),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                255,
                                255,
                                255,
                                1,
                              ).withOpacity(0.06),
                              border: Border.all(
                                color: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ).withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  barrierDismissible: true,
                                  dropdownColor: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                    color: const Color.fromRGBO(
                                      255,
                                      255,
                                      255,
                                      1,
                                    ),
                                  ),

                                  elevation: 15,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                  value: daysPerWeek,
                                  items: [3, 4, 5, 6]
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text("$e days"),
                                        ),
                                      )
                                      .toList(),

                                  onChanged: (value) =>
                                      setState(() => daysPerWeek = value!),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              CommonButton(
                () {
                  generatePlan();
                },
                "Generate Plan",
                Colors.black,
                false,
                const Color.fromARGB(255, 114, 123, 255),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildText(String text) {
  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFFFFFFFF),
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

class _buildTextFormfields extends StatelessWidget {
  final controller;
  final hintText;
  const _buildTextFormfields({
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.06),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 5, right: 10),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,

                    labelStyle: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
