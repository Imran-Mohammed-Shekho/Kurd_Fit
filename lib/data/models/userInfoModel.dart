import 'package:cloud_firestore/cloud_firestore.dart';

class Userinfomodel {
  final String name;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final String fitnessLevel;
  final String issues;
  final String activityLevel;
  final List<String> bodyFoucs;
  final String goal;
  final int workoutsPerWeek;

  const Userinfomodel({
    required this.age,
    required this.gender,
    required this.name,
    required this.goal,
    required this.fitnessLevel,
    required this.height,
    required this.issues,
    required this.workoutsPerWeek,
    required this.bodyFoucs,
    required this.weight,
    required this.activityLevel,
  });

  factory Userinfomodel.fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return Userinfomodel(
      age: data["age"],
      gender: data["gender"],
      name: data["name"],
      goal: data["goal"],
      fitnessLevel: data["fitnessLevel"], // FIXED
      height: data["height"],
      issues: data["issues"],
      workoutsPerWeek: data["workoutsPerWeek"],
      bodyFoucs: List<String>.from(data["bodyFoucs"]), // FIXED
      activityLevel: data["activityLevel"],
      weight: data["weight"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "gender": gender,
      "goal": goal,
      "issues": issues,
      "fitnessLevel": fitnessLevel, // FIXED
      "height": height,
      "bodyFoucs": bodyFoucs, // FIXED
      "workoutsPerWeek": workoutsPerWeek,
      "activityLevel": activityLevel,
      "weight": weight,
    };
  }
}
