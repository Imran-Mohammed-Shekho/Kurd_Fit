class CalorieModel {
  final int age;
  final int height;
  final double weight;
  final int days;
  final String gender;
  final String goal;

  const CalorieModel({
    required this.age,
    required this.height,
    required this.weight,
    required this.days,
    required this.gender,
    required this.goal,
  });

  Map<String, dynamic> toJson() {
    return {
      "age": age,
      "height_cm": height,
      "weight_kg": weight,
      "gender": gender,
      "days_per_week": days,
      "goal": goal,
    };
  }
}
