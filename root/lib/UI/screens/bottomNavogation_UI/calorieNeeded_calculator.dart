// ignore: file_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/DailyCaloireResult.dart';
import 'package:gym/core/Utils/DailyCalorieCalculator.dart';
import 'package:gym/data/models/calorie_model.dart';
import 'package:gym/data/models/calorie_result.dart';

class CalorieNeededCalculator extends StatefulWidget {
  const CalorieNeededCalculator({super.key});

  @override
  State<CalorieNeededCalculator> createState() =>
      _CalorieNeededCalculatorState();
}

class _CalorieNeededCalculatorState extends State<CalorieNeededCalculator> {
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  CalorieResult? result;
  String Goal = "fat_loss";
  String Gender = "female";
  String daysPerWeek = "5";

  bool isLoad = false;

  Future<void> calorieDailyNeededGenerator() async {
    if (Goal.isEmpty ||
        Gender.isEmpty ||
        daysPerWeek.isEmpty ||
        _ageController.text.isEmpty ||
        _heightController.text.isEmpty ||
        _weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "fill all faileds ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple,
          strokeWidth: 10,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
    final req = CalorieModel(
      age: int.parse(_ageController.text),
      height: int.parse(_heightController.text),
      weight: double.parse(_weightController.text),
      days: int.parse(daysPerWeek),
      gender: Gender,
      goal: Goal,
    );
    final calorieNeeded = await generateDailyCalorie(req);

    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        result = calorieNeeded;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      DailyCaloireResult(calorieNeeded, context);
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
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "🔥 Daily Calorie Needed Calculator ",
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
                                  items: ["3", "4", "5", "6"]
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
                () async {
                  await calorieDailyNeededGenerator();
                },
                "Calculate Calorie Needed",
                Colors.white,
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
