// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:math';

class Bmicalculatorbrain {
  double Height;
  double Weight;
  int factor = 10000;
  double _BMI = 0;

  Bmicalculatorbrain({required this.Height, required this.Weight});

  String BmiResult() {
    _BMI = (Weight * factor) / pow(Height, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult() {
    if (_BMI >= 25) {
      return "Oberweight";
    } else if (_BMI >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  getInter() {
    if (_BMI >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_BMI >= 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
