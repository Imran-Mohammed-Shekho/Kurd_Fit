class WorkoutRequestmodel {
  int age;
  int height;
  double weight;
  String goal;
  String experience;
  String days;
  String gender;

  WorkoutRequestmodel({
    required this.age,
    required this.height,
    required this.weight,
    required this.days,
    required this.experience,
    required this.goal,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      "age": age,
      "weight_kg": weight,
      "height_cm": height,
      "days_per_week": days,
      "experience": experience,
      "goal": goal,
      "gender": gender,
    };
  }
}

class WorkoutPlan {
  final Map<String, dynamic> userProfile;
  final Map<String, dynamic> intensity;
  final Map<String, dynamic> split;
  final Map<String, dynamic> days;
  final String imageUrl;

  WorkoutPlan({
    required this.userProfile,
    required this.intensity,
    required this.split,
    required this.days,
    required this.imageUrl,
  });

  factory WorkoutPlan.fromjson(Map<String, dynamic> json) {
    return WorkoutPlan(
      userProfile: json["plan"]["user_profile"],
      intensity: json["plan"]["intensity"],
      split: json["plan"]["split"],
      days: json["plan"]["days"],
      imageUrl: json["image_url"],
    );
  }
}
