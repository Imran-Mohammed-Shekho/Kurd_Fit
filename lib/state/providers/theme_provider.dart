import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeModeKey = "theme_mode";
  ThemeMode themeMode = ThemeMode.dark;

  ThemeProvider() {
    _loadThemePreference();
  }

  void changeTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
    unawaited(_saveThemePreference(themeMode));
  }

  bool get isDark => themeMode == ThemeMode.dark;

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_themeModeKey);
    if (value == null) return;

    if (value == ThemeMode.light.name) {
      themeMode = ThemeMode.light;
    } else if (value == ThemeMode.dark.name) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }

    notifyListeners();
  }

  Future<void> _saveThemePreference(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.name);
  }
}
