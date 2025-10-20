import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MangeWorkoutsPorovider extends ChangeNotifier {
  bool isloadBodyParts = false;
  List<String> BodyParts = [];

  Future<void> fetchBodyparts() async {
    isloadBodyParts = true;
    notifyListeners();

    try {
      final headers = {
        "x-rapidapi-host": "exercisedb.p.rapidapi.com",
        "x-rapidapi-key": "0324fb1332mshd4b8760b3413171p1fd707jsn6b31b03f0932",
      };

      final url = "https://exercisedb.p.rapidapi.com/exercises/targetList";
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        BodyParts = List<String>.from(json.decode(response.body));
        notifyListeners();
      } else if (response.statusCode.isNaN) {
        print("the responseis not number");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("this is the main error $e");
    } finally {
      isloadBodyParts = false;
      notifyListeners();
    }
  }

  List TargetExercises = [];
  bool isLoadTargetExercises = false;
  Future<void> FetchTargetExercises(String target) async {
    isLoadTargetExercises = true;
    notifyListeners();
    try {
      final url =
          "https://exercisedb.p.rapidapi.com/exercises/target/$target?limit=50";
      final headers = {
        "x-rapidapi-host": "exercisedb.p.rapidapi.com ",
        "x-rapidapi-key": "0324fb1332mshd4b8760b3413171p1fd707jsn6b31b03f0932",
      };

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        TargetExercises = List<Map<String, dynamic>>.from(
          json.decode(response.body),
        );
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("this is the error that happen lookn it ");
    } finally {
      isLoadTargetExercises = false;
      notifyListeners();
    }
  }
}
