import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/drawer_section.dart';
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
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "lib/assets/images/Nutback.png",
                fit: BoxFit.cover,
              ),
            ),

            Positioned(top: 10, left: 25, right: 10, child: KurdFitText()),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 85),
                child: Text(
                  "Today's progress",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 130),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: GlassyContainer("Calories", "200g"),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: GlassyContainer("Workout Streak", "7"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 280, horizontal: 34),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

                  child: SizedBox(
                    height: 120,
                    width: double.infinity,

                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Center(
                            child: Text(
                              "Macro Breakdown",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              pfctext("P", 22.0, Alignment.centerLeft, context),
                              SizedBox(width: 10),
                              pfctext("C", 22.0, Alignment.center, context),
                              SizedBox(width: 10),
                              pfctext(
                                "F",
                                22.0,
                                Alignment.centerRight,
                                context,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              pfctext(
                                "200g",
                                14.0,
                                Alignment.centerLeft,
                                context,
                              ),
                              SizedBox(width: 10),
                              pfctext("100g", 14.0, Alignment.center, context),
                              SizedBox(width: 10),
                              pfctext(
                                "700g",
                                14.0,
                                Alignment.centerRight,
                                context,
                              ),
                            ],
                          ),

                          // Center(
                          //   child: Text(
                          //     "+10%",
                          //     style: TextStyle(
                          //       color: const Color.fromARGB(255, 0, 255, 8),
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

            Positioned(
              bottom: 1,
              top: 240,
              left: 25,
              right: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Today’s workout",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                            vertical: BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("lib/assets/images/dashman.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 5,
                                right: 50,
                                left: 10,
                              ),
                              child: Text(
                                "3D Upper Body Workout For Beginner",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(bottom: 5, right: 130),
                              child: Text(
                                "11 Min  72Kcal   Beginner",
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
            Positioned(
              bottom: 30,

              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: () async {
                  final service = FoodAnalyzeService();
                  const rapidKey =
                      '10d6b90ef6msh134fca0010d37dfp1a46d9jsn553d2c054522'; // Forge from RapidAPI's shadowed vault
                  const imageBbKey =
                      'b842897ab573fc9973f7e73e7b4460f6'; // Harvest from imagebb.com's altar

                  final result = await service.analyzeFoodPlate(
                    rapidApiKey: rapidKey,
                    imageBapiKey:
                        imageBbKey, // The new blood—ImageBB's life-essence
                  );

                  if (result != null) {
                    // Manifest the full dissection—JSON paths clawed deep into Codex depths
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Plate\'s Forbidden Yield'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total Nutrition Eclipse:',
                                style: headerStyle,
                              ),
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
                              const Text(
                                'Health Insights from the Depths:',
                                style: subHeaderStyle,
                              ),

                              if (result['result']['health_insights'] !=
                                  null) ...[
                                Text(
                                  'Balance Score: ${result['result']['meal_analysis']['balance_score'] ?? 'Untold'}/10',
                                  style: style,
                                ),
                                Text(
                                  'Meal Type: ${result['result']['meal_analysis']['meal_type'] ?? 'Arcane'}',
                                  style: style,
                                ),
                                Text(
                                  'Suggestions: ${result['result']['health_insights']['suggestions'] ?? 'Silent Void'}',
                                  style: style,
                                ),
                                Text(
                                  'Positive Aspects: ${result['result']['health_insights']['positive_aspects']?.join(', ') ?? 'None Revealed'}',
                                  style: style,
                                ),
                                Text(
                                  'Improvement Fractures: ${result['result']['health_insights']['improvement_areas']?.join(', ') ?? 'None Exposed'}',
                                  style: style,
                                ),
                              ],

                              const SizedBox(height: 8),
                              const Text(
                                'Dietary Sigils & Allergen Shadows:',
                                style: subHeaderStyle,
                              ),

                              if (result['result']['dietary_flags'] !=
                                  null) ...[
                                Text(
                                  'Vegetarian: ${result['result']['dietary_flags']['is_vegetarian'] ?? 'Uncertain'}',
                                  style: style,
                                ),
                                Text(
                                  'Vegan: ${result['result']['dietary_flags']['is_vegan'] ?? 'Denied'}',
                                  style: style,
                                ),
                                Text(
                                  'Gluten-Free: ${result['result']['dietary_flags']['is_gluten_free'] ?? 'Veiled'}',
                                  style: style,
                                ),
                                Text(
                                  'Allergens: ${result['result']['dietary_flags']['allergens']?.join(', ') ?? 'None Lurking'}',
                                  style: style,
                                ),
                              ],

                              // Foods Identified: Loop the array for full heresy (if present)
                              if (result['result']['foods_identified'] !=
                                  null) ...[
                                const SizedBox(height: 8),
                                const Text(
                                  'Sacrificed Foods & Their Yields:',
                                  style: subHeaderStyle,
                                ),
                                ...List<Widget>.from(
                                  (result['result']['foods_identified'] as List)
                                      .map(
                                        (food) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 4,
                                          ),
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
                },
                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //     transitionDuration: Duration(milliseconds: 600),
                //     pageBuilder:
                //         (
                //           BuildContext context,
                //           Animation<double> animation,
                //           Animation<double> secondaryAnimation,
                //         ) {
                //           return FadeThroughTransition(
                //             animation: animation,
                //             secondaryAnimation: secondaryAnimation,
                //             child: Nutitrion_Screen(),
                //           );
                //         },
                //   ),
                // );
                child: SizedBox(
                  height: 100,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

                      child: SizedBox(
                        height: 40,
                        width: double.infinity,

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
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.4),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Nutrition Calculator",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  """Click me & Get your personalized nutrition\nplan by filling out the details.""",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
