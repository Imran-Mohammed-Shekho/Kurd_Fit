// ignore: non_constant_identifier_names
import 'dart:convert';

import 'package:gym/data/models/calorie_model.dart';
import 'package:gym/data/models/calorie_result.dart';
import "package:http/http.dart" as http;

Future generateDailyCalorie(CalorieModel req) async {
  String basUrl = "https://daily-calorie-calculator.onrender.com";

  try {
    final url = Uri.parse("$basUrl/calories");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(req),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CalorieResult.fromJson(json);
    }
  } catch (e) {
    print(e);
  }
}
