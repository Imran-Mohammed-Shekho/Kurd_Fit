import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  final List<String> languages = ["en", "ckb"];
  String selectedLnaguage = "en";

  void changeLanguage(dynamic value) {
    if (value is int) {
      if (value < 0 || value >= languages.length) return;
      selectedLnaguage = languages[value];
      notifyListeners();
      return;
    }

    if (value is String && languages.contains(value)) {
      selectedLnaguage = value;
      notifyListeners();
    }
  }

  bool isselected(String language) {
    return selectedLnaguage == language;
  }
}
