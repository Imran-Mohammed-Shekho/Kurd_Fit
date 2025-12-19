import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  List<String> languages = ["en", "ckb"];
  String selectedLnaguage = "en";

  void changeLanguage(index) {
    if (index <= 1) {
      selectedLnaguage = languages[index];
      notifyListeners();
    }
  }

  bool isselected(String language) {
    return selectedLnaguage == language;
  }
}
