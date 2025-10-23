import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MangeWorkoutsPorovider extends ChangeNotifier {
  bool isloadBodyParts = false;
  List<Map<String, dynamic>> BodyParts = [];

  Future<void> fetchBodyparts() async {
    isloadBodyParts = true;
    notifyListeners();

    try {
      final url = "https://db-sigma-eight.vercel.app/api/v1/bodyparts";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final dataBody = json.decode(response.body);
        BodyParts = List<Map<String, dynamic>>.from(dataBody["data"]);

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

  bool isLoadTargetExercises = false;
  List<Map<String, dynamic>> TargetExercises = [];

  Future<void> FetchTargetExercises(String target) async {
    isLoadTargetExercises = true;
    notifyListeners();
    try {
      final url =
          "https://db-sigma-eight.vercel.app/api/v1/bodyparts/$target/exercises?offset=0&limit=25";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        if (decoded["success"] == true) {
          TargetExercises = List<Map<String, dynamic>>.from((decoded["data"]));
        } else {
          throw Exception("API request is unsuccsesful >$decoded");
        }
      } else {
        throw Exception("failed to load exercises ${response.statusCode}");
      }
    } catch (e) {
      print("Error ouccured whille fetching the exercises list $e");
    } finally {
      isLoadTargetExercises = false;
      notifyListeners();
    }
  }

  String _SelectedWorkOut = "";

  String get SelectedWorkOut => _SelectedWorkOut;

  void ChangeSelecetedWorkout(workout) {
    _SelectedWorkOut = workout;
    notifyListeners();
  }
}
