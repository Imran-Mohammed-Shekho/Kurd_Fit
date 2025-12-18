// ignore_for_file: file_names

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/CommonWidget/resuableProgressIndicator.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/BmiScreen.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/DaashboardWidgets/activity_section.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/DaashboardWidgets/greeting_text.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/WorkoutPlanGenerator.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/DailyCaloriePage.dart';
import 'package:gym/UI/screens/drawer_UI/drawer_section.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';
import 'package:gym/services/foodAnalayze_service.dart';
import 'package:gym/state/providers/profile_provider.dart';
import 'package:gym/state/providers/theme_provider.dart';
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

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

// ignore: camel_case_types
class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
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
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
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
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
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

  // Future<bool> hasInternet() async {
  //   final result = await Connectivity().checkConnectivity();
  //   return result != ConnectivityResult.none;
  // }

  Future calculateFoodPlate() async {
    final service = FoodAnalyzeService(
      changeloding: (value) => setState(() {
        isLoad = value;
      }),
    );
    // if (!connected) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       duration: Duration(seconds: 2),
    //       content: Text("internet connection failed "),
    //       backgroundColor: kred,
    //     ),
    //   );
    //   return;
    // }
    ;
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
                ...foods.map((food) => _buildFoodItemCard(food)),
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
    final Themeprovider = context.watch<ThemeProvider>();

    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      key: scaffoldKey,
      endDrawer: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, 0, 0),
        child: Drawer(child: DrawerSection()),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                KurdFitText(),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Themeprovider.changeTheme();
                  },
                  icon: Icon(
                    Themeprovider.isDark ? Icons.light_mode : Icons.dark_mode,
                  ),
                ),
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
                    ? CircularProgressIndicator(color: Colors.amber.shade600)
                    : GreetingUser(username: username),
              ),
            ),
            SizedBox(height: 10),

            _buildlabes("Your Daily progress", 16, false),
            SizedBox(height: 10),

            SizedBox(
              height: 140,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  resuableCircleCounts(
                    context,
                    (1200),
                    "Calories",
                    Icons.local_fire_department,
                  ),
                  resuableCircleCounts(context, 74, "Min", Icons.timer),
                  resuableCircleCounts(
                    context,
                    (2000),
                    "Steps",
                    "assets/icons/footPrint.svg",
                  ),
                  SizedBox(),
                ],
              ),
            ),

            _buildlabes("AI - Powered Tools", 20, false),
            SizedBox(height: 10),

            Center(child: isLoad ? reusableProgressIndicator() : null),
            Row(
              children: [
                Expanded(
                  child: _buildContainers(
                    context,
                    () {
                      calculateFoodPlate();
                    },
                    "assets/icons/resturant.svg",
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

            _buildlabes("This Week's Progress", 20, false),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ActivitySection(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column resuableCircleCounts(
    BuildContext context,
    int count,
    title,
    dynamic icon,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: icon is IconData
                  ? Icon(icon, size: 42, color: kwhite)
                  : SvgPicture.asset(icon, height: 35, width: 35),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(count.toString(), style: TextStyle()),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
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
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
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

Widget _buildlabes(String label, double size, bool isbold) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}
