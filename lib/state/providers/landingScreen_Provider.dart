import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/GoalScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/LevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/WorkoutsDaysinWeekScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/activityLevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/ageScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/BodyFocusScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/heightScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/issuesScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/nameScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/weightScreen.dart';
import 'package:gym/UI/screens/login&SignUP_UI/SignUp_screen.dart';

class LandingscreenProvider extends ChangeNotifier {
  int index = 0;

  String name = '';
  String gender = '';
  int age = 0;
  int height = 0;
  int weight = 0;
  String exLevel = '';
  String issues = '';
  String activityLevel = '';
  String bodyFoucs = '';
  String goal = '';
  int? workoutDays;

  int selectedIndex = -1;

  final List pages = [
    GenderSecreen(),
    Goalscreen(),
    Bodyfocusscreen(),
    Levelscreen(),
    Activitylevelscreen(),
    Heightscreen(),
    Weightscreen(),
    Agescreen(),
    Namescreen(),
    Issuesscreen(),
    Workoutsdaysinweekscreen(),
    SignupScreen(),
  ];

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setAge(int value) {
    age = value;
    notifyListeners();
  }

  void setHeight(int value) {
    height = value;
    notifyListeners();
  }

  void setWeight(int value) {
    weight = value;
    notifyListeners();
  }

  void setGoal(String value) {
    goal = value;
    notifyListeners();
  }

  void setExlevel(String value) {
    exLevel = value;
    notifyListeners();
  }

  void setGender(String value) {
    gender = value;
    notifyListeners();
  }

  void setActivityLevel(String value) {
    activityLevel = value;
    notifyListeners();
  }

  void setIssues(String value) {
    issues = value;
    notifyListeners();
  }

  void changeCurrentIndex() {
    if (index <= 12) {
      index += 1;
    }
    notifyListeners();
  }

  void setWorkoutDays(int value) {
    workoutDays = value;
    notifyListeners();
  }

  void setBodyFoucs(String value) {
    bodyFoucs = value;
    notifyListeners();
  }

  void decrementIndex() {
    if (index > 0) {
      index -= 1;
      notifyListeners();
    }
  }

  int get currentindex => index;
}
