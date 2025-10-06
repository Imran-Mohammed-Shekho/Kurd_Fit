import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color drawerbg;
  final Color bottomNavigationBarBg;
  final Color ButtonFrombottomNavigationbar;
  final Color TextFrombottomNavigationbar;

  const CustomColors({
    required this.drawerbg,
    required this.bottomNavigationBarBg,
    required this.ButtonFrombottomNavigationbar,
    required this.TextFrombottomNavigationbar,
  });
  @override
  ThemeExtension<CustomColors> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      ButtonFrombottomNavigationbar: ButtonFrombottomNavigationbar,
      drawerbg: drawerbg,
      bottomNavigationBarBg: bottomNavigationBarBg,
      TextFrombottomNavigationbar: TextFrombottomNavigationbar,
    );
  }
}
