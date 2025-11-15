import 'package:flutter/material.dart';
import 'package:gym/data/models/calorie_result.dart';

// ignore: non_constant_identifier_names
Widget DailyCaloireResult(CalorieResult? calorieNeeded) {
  return Card(
    shape: Border.all(),
    child: Column(
      children: [
        Text(" Bmr: ${calorieNeeded!.Bmr}"),
        Text("Re :${calorieNeeded.RecommendedCalories}"),
        Text("tdee :${calorieNeeded.Tdee}"),
      ],
    ),
  );
}
