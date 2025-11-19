import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/UI/CommonWidget/CircleRing_Ui.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/BmiScreen.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/WeekActivity.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/WorkoutPlanGenerator.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/DailyCaloriePage.dart';
import 'package:gym/UI/screens/drawer_UI/drawer_section.dart';
import 'package:gym/services/foodAnalayze_service.dart';
import 'package:gym/state/providers/profile_provider.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      final name = Provider.of<ProfileProvider>(context, listen: false);
      if (name.userModel == null) {
        name.getUserDataFromFirestore(FirebaseAuth.instance.currentUser!.uid);
      }
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoad = false;
  bool isLoading = false;

  void changeToTure() {
    setState(() {
      isLoad = true;
    });
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildNutritionRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.white, fontSize: 14)),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItemCard(dynamic food) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.restaurant, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "${food['name']} (${food['portion_size']})\n"
              "🔥 ${food['calories']} kcal   💪 ${food['protein']}g   🍞 ${food['carbs']}g   🧈 ${food['fats']}g",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
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
      final nutrition = result['result']['total_nutrition'];
      final foods = (result['result']['foods_identified'] as List?) ?? [];

      showDialog(
        context: context,

        builder: (context) => AlertDialog(
          insetPadding: EdgeInsets.all(20),
          backgroundColor: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Total Nutrition Card
                _buildInfoCard([
                  _buildNutritionRow(
                    "🔥 Calories",
                    "${nutrition['total_calories']} kcal",
                  ),
                  _buildNutritionRow(
                    "💪 Protein",
                    "${nutrition['total_protein']} g",
                  ),
                  _buildNutritionRow(
                    "🍞 Carbs",
                    "${nutrition['total_carbs']} g",
                  ),
                  _buildNutritionRow("🧈 Fats", "${nutrition['total_fats']} g"),
                  _buildNutritionRow("🌿 Fiber", "${nutrition['fiber']} g"),
                ]),

                SizedBox(height: 15),

                Text(
                  "🥗 Food Breakdown",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),

                if (foods.isEmpty)
                  Text(
                    "No foods detected.",
                    style: TextStyle(color: Colors.white70),
                  ),
                ...foods.map((food) => _buildFoodItemCard(food)).toList(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String? username = Provider.of<ProfileProvider>(context, listen: true).name;

    gretingUser() {
      final int time = DateTime.now().hour;

      if (time < 12) {
        return "Good Morning $username 👋!";
      } else if (time < 17) {
        return "Good Afternoon $username 😎";
      } else {
        return "Good Evening $username 🌙";
      }
    }

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
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.amber.shade600,
                          )
                        : AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TyperAnimatedText(
                                gretingUser(),
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
                          "lib/assets/icons/footPrint.svg",
                          "Steps",
                          "1,200",
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: CircleRing(0.6, Icons.timer, "Min", "22"),
                      ),

                      SizedBox(width: 40),

                      Expanded(
                        flex: 1,
                        child: CircleRing(
                          0.3,
                          Icons.local_fire_department,
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
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Workoutplangenerator(),
                            ),
                          );
                        },
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CalorieNeededCalculator(),
                            ),
                          );
                        },
                        Icons.calculate,
                        "Daily Calorie Needed Calculator",
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: _buildContainers(
                        context,
                        () {
                          bmiResult(context);
                        },
                        Icons.calculate,
                        "BMI Calculator",
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
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WeekActivity(),
                                          ),
                                        );
                                      },
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
  final double h = (height is int) ? height.toDouble() : height;
  return Column(
    children: [
      SizedBox(
        height: h,
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
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
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
    return SvgPicture.asset(icon, height: 30, width: 30, fit: BoxFit.cover);
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
