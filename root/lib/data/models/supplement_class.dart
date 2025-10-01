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
    description:
        "Supports muscle recovery and growth. Best taken after workouts to help repair muscles and improve strength.",
    imagePath: "assets/images/whey_protein.png",
    price: 45.0,
  ),
  Supplement(
    title: "Creatine Monohydrate",
    description:
        "Increases strength, power, and endurance by boosting ATP production. Ideal for high-intensity training.",
    imagePath: "assets/images/creatine.png",
    price: 25.0,
  ),
  Supplement(
    title: "BCAA (Branched-Chain Amino Acids)",
    description:
        "Helps reduce muscle soreness and fatigue. Supports muscle recovery and prevents breakdown during workouts.",
    imagePath: "assets/images/bcaa.png",
    price: 30.0,
  ),
  Supplement(
    title: "Pre-Workout",
    description:
        "Boosts energy, focus, and endurance before training. Often contains caffeine, beta-alanine, and nitric oxide boosters.",
    imagePath: "assets/images/preworkout.png",
    price: 35.0,
  ),
  Supplement(
    title: "Glutamine",
    description:
        "Supports muscle recovery and immune health. Helps reduce muscle breakdown after intense training.",
    imagePath: "assets/images/glutamine.png",
    price: 20.0,
  ),
  Supplement(
    title: "Fish Oil (Omega-3)",
    description:
        "Promotes heart health, reduces inflammation, and supports joint recovery. Essential for overall fitness.",
    imagePath: "assets/images/fish_oil.png",
    price: 18.0,
  ),
  Supplement(
    title: "Multivitamins",
    description:
        "Provides essential vitamins and minerals to fill nutritional gaps and support general health.",
    imagePath: "assets/images/multivitamins.png",
    price: 15.0,
  ),
  Supplement(
    title: "Casein Protein",
    description:
        "Slow-digesting protein ideal for overnight recovery. Helps prevent muscle breakdown during sleep.",
    imagePath: "assets/images/casein.png",
    price: 42.0,
  ),
  Supplement(
    title: "Mass Gainer",
    description:
        "High-calorie supplement that helps build size and strength. Great for people struggling to gain weight.",
    imagePath: "assets/images/mass_gainer.png",
    price: 50.0,
  ),
  Supplement(
    title: "Electrolytes",
    description:
        "Helps maintain hydration and muscle function during intense workouts or long training sessions.",
    imagePath: "assets/images/electrolytes.png",
    price: 12.0,
  ),
];
