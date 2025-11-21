class CalorieResult {
  final double Bmr;
  final double Tdee;
  final int RecommendedCalories;

  final List<dynamic> note;
  const CalorieResult({
    required this.Bmr,
    required this.RecommendedCalories,
    required this.Tdee,
    required this.note,
  });

  factory CalorieResult.fromJson(Map<String, dynamic> json) {
    return CalorieResult(
      Bmr: json["bmr"],
      RecommendedCalories: json["recommended_calories"],
      Tdee: json["tdee"],
      note: json["notes"],
    );
  }
}
