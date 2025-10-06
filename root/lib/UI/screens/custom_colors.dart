import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color drawerbg;
  final Color? GYmBu;

  const CustomColors({required this.drawerbg, this.GYmBu});
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
    return CustomColors(drawerbg: drawerbg, GYmBu: GYmBu);
  }
}
