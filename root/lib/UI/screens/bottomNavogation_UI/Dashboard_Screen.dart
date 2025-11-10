import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/UI/CommonWidget/CircleRing_Ui.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/drawer_UI/drawer_section.dart';
import 'package:gym/services/foodAnalayze_service.dart';

const TextStyle headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  color: Colors.white,
);

const TextStyle style = TextStyle(fontSize: 14, color: Colors.white);

const TextStyle subHeaderStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: Colors.white,
);

class Dashboard_Screen extends StatefulWidget {
  const Dashboard_Screen({super.key});

  @override
  State<Dashboard_Screen> createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoad = false;

  void changeToTure() {
    setState(() {
      isLoad = true;
    });
  }

  String gretingUser(String name) {
    final int time = DateTime.now().hour;
    if (time < 12) {
      return "Good Morning $name 👋!";
    } else if (time < 17) {
      return "Good Afternoon $name 😎";
    } else {
      return "Good Evening $name 🌙";
    }
  }

  Future calculateFoodPlate() async {
    final service = FoodAnalyzeService(
      changeloding: (value) => setState(() {
        isLoad = value;
      }),
    );

    final result = await service.analyzeFoodPlate(
      rapidApiKey: rapidKey,
      imageBapiKey: imageBbKey,
    );

    if (!mounted) {
      return;
    }

    if (result != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Plate\'s Forbidden Yield'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total Nutrition Eclipse:', style: headerStyle),
                Text(
                  'Calories: ${result['result']['total_nutrition']['total_calories'] ?? 'Veiled in Shadow'}',
                  style: style,
                ),
                Text(
                  'Protein: ${result['result']['total_nutrition']['total_protein'] ?? 'Shrouded'}g',
                  style: style,
                ),
                Text(
                  'Carbs: ${result['result']['total_nutrition']['total_carbs'] ?? 'Enigmatic'}g',
                  style: style,
                ),
                Text(
                  'Fats: ${result['result']['total_nutrition']['total_fats'] ?? 'Obscured'}g',
                  style: style,
                ),
                Text(
                  'Fiber: ${result['result']['total_nutrition']['fiber'] ?? 'Whispered'}g',
                  style: style,
                ),

                const SizedBox(height: 8),

                // const Text(
                //   'Health Insights from the Depths:',
                //   style: subHeaderStyle,
                // ),

                // if (result['result']['health_insights'] !=
                //     null) ...[
                //   Text(
                //     'Balance Score: ${result['result']['meal_analysis']['balance_score'] ?? 'Untold'}/10',
                //     style: style,
                //   ),
                //   Text(
                //     'Meal Type: ${result['result']['meal_analysis']['meal_type'] ?? 'Arcane'}',
                //     style: style,
                //   ),
                //   Text(
                //     'Suggestions: ${result['result']['health_insights']['suggestions'] ?? 'Silent Void'}',
                //     style: style,
                //   ),
                //   Text(
                //     'Positive Aspects: ${result['result']['health_insights']['positive_aspects']?.join(', ') ?? 'None Revealed'}',
                //     style: style,
                //   ),
                //   Text(
                //     'Improvement Fractures: ${result['result']['health_insights']['improvement_areas']?.join(', ') ?? 'None Exposed'}',
                //     style: style,
                //   ),
                // ],
                const SizedBox(height: 8),
                // const Text(
                //   'Dietary Sigils & Allergen Shadows:',
                //   style: subHeaderStyle,
                // ),

                // if (result['result']['dietary_flags'] !=
                //     null) ...[
                //   Text(
                //     'Vegetarian: ${result['result']['dietary_flags']['is_vegetarian'] ?? 'Uncertain'}',
                //     style: style,
                //   ),
                //   Text(
                //     'Vegan: ${result['result']['dietary_flags']['is_vegan'] ?? 'Denied'}',
                //     style: style,
                //   ),
                //   Text(
                //     'Gluten-Free: ${result['result']['dietary_flags']['is_gluten_free'] ?? 'Veiled'}',
                //     style: style,
                //   ),
                //   Text(
                //     'Allergens: ${result['result']['dietary_flags']['allergens']?.join(', ') ?? 'None Lurking'}',
                //     style: style,
                //   ),
                // ],

                // Foods Identified: Loop the array for full heresy (if present)
                if (result['result']['foods_identified'] != null) ...[
                  const SizedBox(height: 8),
                  const Text(
                    'Sacrificed Foods & Their Yields:',
                    style: subHeaderStyle,
                  ),
                  ...List<Widget>.from(
                    (result['result']['foods_identified'] as List).map(
                      (food) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '${food['name']} (${food['portion_size']}): ~${food['calories']} cal | P:${food['protein']}g | C:${food['carbs']}g | F:${food['fats']}g',
                          style: style,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK', style: style),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Rite faltered—keys impure? Or upload abyss rejects? Console whispers the sin.',
            style: style,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        key: scaffoldKey,
        endDrawer: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, 0, 0),
          child: Drawer(child: drawer_section()),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Row(
                  children: [
                    KurdFitText(),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                      icon: Icon(Icons.menu, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText(
                          gretingUser("Imran"),
                          speed: Duration(milliseconds: 100),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 35, 2, 56),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                _buildlabes("Today's progress"),
                SizedBox(height: 10),

                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleRing(
                          0.9,
                          Icons.timer_rounded,
                          "Steps",
                          "1,200",
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: CircleRing(
                          0.6,
                          Icons.local_fire_department,
                          "Min",
                          "22",
                        ),
                      ),

                      SizedBox(width: 40),

                      Expanded(
                        flex: 1,
                        child: CircleRing(
                          0.3,
                          "lib/assets/icons/footPrint.svg",
                          "Kcal",
                          "800g",
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),
                _buildlabes("AI - Powered Tools"),
                SizedBox(height: 10),

                // Positioned(
                //   bottom: 80,
                //   left: 25,
                //   right: 25,
                //   child: dashboradBottom(
                //     () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => Workouts_Screen(),
                //         ),
                //       );
                //     },
                //     "Start Workouts",
                //     Colors.white,
                //   ),
                // ),
                Center(
                  child: isLoad
                      ? CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                          valueColor: AlwaysStoppedAnimation(
                            const Color(0xFF673AB7),
                          ),
                          backgroundColor: Colors.white,
                          strokeWidth: 5,
                        )
                      : null,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildContainers(
                        context,
                        () {
                          calculateFoodPlate();
                        },
                        "lib/assets/icons/resturant.svg",
                        "Food Kcal \nAnalyzer With AI",
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: _buildContainers(
                        context,
                        () {},
                        Icons.fitness_center,
                        "Workout Plan Generator ",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildContainers(
                        context,
                        () {
                          calculateFoodPlate();
                        },
                        Icons.calculate,
                        "Calorie Calculator",
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: _buildContainers(
                        context,
                        () {},
                        Icons.food_bank,
                        "AI Nutrition Plan",
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                _buildlabes("This Week's Progress"),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Activity",
                                      style: TextStyle(
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Veiw Activity",
                                        style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          decoration: TextDecoration.underline,
                                          decorationColor: const Color(
                                            0xFFFFFFFF,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildWeekTable(true, "Saturday", 100),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildWeekTable(false, "Sunday", 130),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildWeekTable(false, "Monday", 140),
                                    ],
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildWeekTable(false, "Tuesday", 160),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildWeekTable(false, "Wednesday", 60),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildWeekTable(false, "Thursday", 90),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _buildWeekTable(false, "Friday", 190),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildWeekTable(isToday, label, height) {
  return Column(
    children: [
      SizedBox(
        height: height,
        width: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isToday ? const Color(0xFF673AB7) : const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      SizedBox(height: 10),
      Text(label, style: TextStyle(color: const Color(0xFFFFFFFF))),
      SizedBox(height: 10),
    ],
  );
}

Widget _buildContainers(
  BuildContext context,
  VoidCallback ontap,
  dynamic icon,
  String text,
) {
  return GestureDetector(
    onTap: ontap,

    child: SizedBox(
      height: 100,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

          child: SizedBox(
            height: 40,
            width: 200,

            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildIcon(icon),
                    ),
                    SizedBox(height: 8),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   child: Text(
                    //     textAlign: TextAlign.center,
                    //     """Get info about food on plate .""",
                    //     style: TextStyle(
                    //       fontSize: 12,

                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildIcon(icon) {
  if (icon is IconData) {
    return Icon(icon, size: 40, color: const Color(0xFFFFFFFF));
  } else {
    return SvgPicture.asset(height: 30, width: 30, icon, fit: BoxFit.cover);
  }
}

Widget _buildlabes(String label) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
