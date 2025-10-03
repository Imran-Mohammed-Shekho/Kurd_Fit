import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  List<String> languages = ["English", "Kurdish", "Arabic"];
  String selectedLnaguage = "English";

  void change_language(language) {
    selectedLnaguage = language;
    notifyListeners();
  }

  bool isselected(String language) {
    return selectedLnaguage == language;
  }
}
