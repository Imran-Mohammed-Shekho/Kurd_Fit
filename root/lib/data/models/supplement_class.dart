class Supplement {
  String title;
  String description;
  String imagePath;
  double price;

  Supplement({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
  });
}

List<Supplement> supplements = [
  Supplement(
    title: "Whey Protein",
    description: "Supports muscle recovery and growth. .",
    imagePath: "lib/assets/images/item1.png",
    price: 45.0,
  ),
  Supplement(
    title: "Creatine Monohydrate",
    description:
        "Increases strength, power, and endurance by\nboosting ATP production. ",
    imagePath: "lib/assets/images/item1.png",
    price: 25.0,
  ),
  Supplement(
    title: "BCAA ",
    description: "Helps reduce muscle soreness and fatigue.",
    imagePath: "lib/assets/images/item1.png",
    price: 30.0,
  ),
  Supplement(
    title: "Pre-Workout",
    description: "Boosts energy, focus, and endurance before training.\n .",
    imagePath: "lib/assets/images/item1.png",
    price: 35.0,
  ),
  Supplement(
    title: "Glutamine",
    description: "Supports muscle recovery and immune health.",
    imagePath: "lib/assets/images/item1.png",
    price: 20.0,
  ),
  Supplement(
    title: "Fish Oil (Omega-3)",
    description:
        "Promotes heart health, reduces inflammation\n and supports joint recovery. ",
    imagePath: "lib/assets/images/item1.png",
    price: 18.0,
  ),
  Supplement(
    title: "Multivitamins",
    description:
        "Provides essential vitamins and minerals\nto fill nutritional gaps",
    imagePath: "lib/assets/images/item1.png",
    price: 15.0,
  ),
  Supplement(
    title: "Casein Protein",
    description: "Slow-digesting protein ideal for overnight recovery.",
    imagePath: "lib/assets/images/item1.png",
    price: 42.0,
  ),
  Supplement(
    title: "Mass Gainer",
    description: "High-calorie supplement that helps build size and strength. ",
    imagePath: "lib/assets/images/item1.png",
    price: 50.0,
  ),
  Supplement(
    title: "Electrolytes",
    description:
        "Helps maintain hydration and muscle\nfunction during intense workouts ",
    imagePath: "lib/assets/images/item1.png",
    price: 12.0,
  ),
];
