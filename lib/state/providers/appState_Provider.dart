import 'package:flutter/material.dart';

class AppstateProvider extends ChangeNotifier {
  int currentindex = 0;

  void updatePageState(int index) {
    if (index >= 4) {
      return;
    } else {
      currentindex = index;
      notifyListeners();
    }
  }
}
