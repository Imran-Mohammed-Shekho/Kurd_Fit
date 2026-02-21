import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/resuableProgressIndicator.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/WorkoutGeneratedResult.dart';
import 'package:gym/UI/screens/landingScreen_UI/LevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/core/Utils/localized_text.dart';
import 'package:gym/data/models/workout_requestModel.dart';
import 'package:gym/services/AI_workout_generator_service.dart';

const style = TextStyle(color: Colors.black);
Color popupDropdownColor = Colors.grey.shade800;

class Workoutplangenerator extends StatefulWidget {
  const Workoutplangenerator({super.key});

  @override
  State<Workoutplangenerator> createState() => _WorkoutplangeneratorState();
}

class _WorkoutplangeneratorState extends State<Workoutplangenerator>
    with SingleTickerProviderStateMixin {
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  // late AnimationController _controller;
  // late Animation<double> _animation;

  String Goal = "fat_loss";
  String Gender = "female";
  String daysPerWeek = "5";
  String experience = "beginner";

  Future generatePlan() async {
    if (Goal.isEmpty ||
        Gender.isEmpty ||
        daysPerWeek.isEmpty ||
        experience.isEmpty ||
        _ageController.text.isEmpty ||
        _heightController.text.isEmpty ||
        _weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,

          content: Text(
            tr(context, "fill all faileds "),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (context) => Center(child: reusableProgressIndicator()),
    );
    if (!mounted) return;
    try {
      final req = WorkoutRequestmodel(
        age: int.parse(_ageController.text),
        height: int.parse(_heightController.text),
        weight: double.parse(_weightController.text),
        days: daysPerWeek,
        experience: experience,
        goal: Goal,
        gender: Gender,
      );

      final plan = await generateWorkoutPlan(req);
      if (!mounted) return;
      if (plan.imageUrl.isNotEmpty) {
        _showMessage("Workout plan has been created ", Colors.green);
        Navigator.pop(context);

        await Future.delayed(Duration(seconds: 2));
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Workoutgeneratedresult(paln: plan),
          ),
        );
      } else {
        _showMessage("response from server is null", Colors.red);
      }
    } catch (e) {
      _showMessage(e, Colors.red);
    }
  }

  void _showMessage(e, color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: color,
        duration: Duration(seconds: 3),
        content: Text("$e", style: TextStyle(color: kwhite)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          "🔥 ${tr(context, "Workout Generator")}",
          style: TextStyle(
            fontSize: 20,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Form(
            child: Column(
              children: [
                _buildText(context, "Age"),
                _buildTextFormfields(
                  controller: _ageController,
                  hintText: "age",
                ),
                _buildText(context, "Height/Cm"),
                _buildTextFormfields(
                  controller: _heightController,
                  hintText: "Height in cm",
                ),
                _buildText(context, "Weight/Kg"),
                _buildTextFormfields(
                  controller: _weightController,
                  hintText: "Weight in Kg",
                ),

                _buildText(context, "Goal"),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: kwhite.withValues(alpha: 0.06),
                          border: Border.all(
                            color: kwhite.withValues(alpha: 0.2),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              barrierDismissible: true,
                              dropdownColor: popupDropdownColor,
                              borderRadius: BorderRadius.circular(16),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 40,
                                color: Colors.white,
                              ),

                              elevation: 15,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              value: Goal,
                              items: [
                                DropdownMenuItem(
                                  value: "fat_loss",
                                  child: Text(tr(context, "fat loss")),
                                ),
                                DropdownMenuItem(
                                  value: "muscle gain",
                                  child: Text(tr(context, "muscle gain")),
                                ),
                                DropdownMenuItem(
                                  value: "strength",
                                  child: Text(tr(context, "strength")),
                                ),
                                DropdownMenuItem(
                                  value: "general fitness",
                                  child: Text(tr(context, "general fitness")),
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
                _buildText(context, "Gender"),

                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: kwhite.withValues(alpha: 0.06),
                          border: Border.all(
                            color: kwhite.withValues(alpha: 0.2),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              barrierDismissible: true,
                              dropdownColor: popupDropdownColor,
                              borderRadius: BorderRadius.circular(16),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 40,
                                color: kwhite,
                              ),

                              style: TextStyle(
                                color: kwhite,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              value: Gender,
                              items: [
                                DropdownMenuItem(
                                  value: "male",
                                  child: Text(tr(context, "male")),
                                ),
                                DropdownMenuItem(
                                  value: "female",
                                  child: Text(tr(context, "female")),
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
                _buildText(context, "Experience"),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: kwhite.withValues(alpha: 0.06),
                          border: Border.all(
                            color: kwhite.withValues(alpha: 0.2),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              barrierDismissible: true,
                              dropdownColor: popupDropdownColor,
                              borderRadius: BorderRadius.circular(16),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 40,
                                color: const Color(0xFFFFFFFF),
                              ),

                              elevation: 15,
                              style: TextStyle(
                                color: kwhite,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              value: experience,
                              items: [
                                DropdownMenuItem(
                                  value: "beginner",
                                  child: Text(tr(context, "beginner")),
                                ),
                                DropdownMenuItem(
                                  value: "intermediate",
                                  child: Text(tr(context, "intermediate")),
                                ),
                                DropdownMenuItem(
                                  value: "advanced",
                                  child: Text(tr(context, "advanced")),
                                ),
                              ],
                              onChanged: (value) =>
                                  setState(() => experience = value.toString()),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                _buildText(context, "How many days do you prefer?"),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: kwhite.withValues(alpha: 0.06),
                          border: Border.all(
                            color: kwhite.withValues(alpha: 0.2),
                          ),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              barrierDismissible: true,
                              dropdownColor: popupDropdownColor,
                              borderRadius: BorderRadius.circular(16),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 40,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),

                              elevation: 15,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              value: daysPerWeek,
                              items: ["3", "4", "5", "6"]
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text("$e ${tr(context, "day")}"),
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
          buildButtom(
            ontap: () {
              generatePlan();
            },
            text: tr(context, "Generate Plan"),
            isTrue: false,
          ),
        ],
      ),
    );
  }
}

Widget _buildText(BuildContext context, String text) {
  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        tr(context, text),
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
                color: kwhite.withValues(alpha: 0.06),
                border: Border.all(color: kwhite.withValues(alpha: 0.2)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 5, right: 10),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: tr(context, hintText),
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
