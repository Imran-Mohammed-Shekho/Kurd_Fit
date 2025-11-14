import 'dart:convert';

import 'package:gym/data/models/workout_requestModel.dart';
import 'package:http/http.dart' as http;

Future<WorkoutPlan> generateWorkoutPlan(WorkoutRequestmodel req) async {
  String basurl = "http://0.0.0.0:8000";

  final url = Uri.parse("$basurl/generate");
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(req),
  );
  try {
    if (response.statusCode != 200) {
      throw Exception("ther request failed server error . > imarn");
    }
  } catch (e) {
    print("$e");
  }

  final json = jsonDecode(response.body);
  return WorkoutPlan.fromjson(json);
}
