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
  int? height;
  int weight = 0;
  String fitnessLevel = '';
  String issues = '';
  String activityLevel = '';
  List<String> bodyFoucs = [];
  String goal = '';
  double workoutsPerWeek = 5;
  int selecteHeight = 0;
  int selectedWeight = 50;
  int selectedAge = 22;
  int currentDays = 4;
  double? selectedDays;

  Map<String, int> selectedIndex = {};

  // ignore: non_constant_identifier_names
  List? BodyFoucsSelecetedIndex = [];

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
  setCurrentHeight(value) {
    selecteHeight = value + 100;
    notifyListeners();
  }

  getinitialItem() {
    return selecteHeight - 100;
  }

  setCurrentAge(value) {
    selectedAge = value + 14;
    notifyListeners();
  }

  setWorkoutsPerWeek(value) {
    workoutsPerWeek = value;
    notifyListeners();
  }

  double get getSelectedWorkoutsDay => workoutsPerWeek;

  getinitialItemAge() {
    return selectedAge - 14;
  }

  getinitialItemWeight() {
    return selectedWeight = selectedWeight - 30;
  }

  setCurrentWeight(value) {
    selectedWeight = value + 30;
    notifyListeners();
  }

  void setBodyFoucsIndex(int index) {
    if (BodyFoucsSelecetedIndex!.contains(index)) {
      BodyFoucsSelecetedIndex!.remove(index);
      notifyListeners();
    } else {
      BodyFoucsSelecetedIndex!.add(index);
      notifyListeners();
    }
  }

  void AddSelectedIndex(String key, int index) {
    selectedIndex[key] = index;
    notifyListeners();
  }

  int? getSelected(String key) {
    return selectedIndex[key];
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

  void setFitnesslevel(String value) {
    fitnessLevel = value;
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

  void setWorkoutDays(double value) {
    selectedDays = value;
    notifyListeners();
  }

  void setBodyFoucs(String value) {
    if (bodyFoucs.contains(value)) {
      return;
    } else {
      bodyFoucs.add(value);
    }
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
