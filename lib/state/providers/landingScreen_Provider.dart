import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/GoalScreen/GoalScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/LevelScreen/LevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/activityLevel/activityLevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/bodyFoucsScreen/BodyFocusScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/heightScreen.dart';
import 'package:gym/UI/screens/login&SignUP_UI/SignUp_screen.dart';

class LandingscreenProvider extends ChangeNotifier {
  int index = 0;

  final List pages = [
    GenderSecreen(),
    Goalscreen(),
    Bodyfocusscreen(),
    Levelscreen(),
    Activitylevelscreen(),
    Heightscreen(),
    SignupScreen(),
  ];

  void changeCurrentIndex() {
    if (index <= 5) {
      index += 1;
    }
    notifyListeners();
  }

  int get currentindex => index;
}
