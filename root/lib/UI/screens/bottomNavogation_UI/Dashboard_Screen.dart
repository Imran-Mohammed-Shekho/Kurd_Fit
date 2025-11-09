import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/CommonWidget/glassy_container.dart';
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
            child: Column(
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Good Morning Imarn !",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 97, 43, 5),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Today's progress",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: GlassyContainer(
                            Icon(Icons.fingerprint, size: 40),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          flex: 1,
                          child: GlassyContainer(Icon(Icons.fireplace_sharp)),
                        ),

                        SizedBox(width: 20),
                        Flexible(
                          flex: 1,
                          child: GlassyContainer(Icon(Icons.fireplace_sharp)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("data"), Text("data"), Text("data")],
                    ),
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 280, horizontal: 34),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: BackdropFilter(
                //       filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

                //       child: SizedBox(
                //         height: 120,
                //         width: double.infinity,

                //         child: DecoratedBox(
                //           decoration: BoxDecoration(
                //             color: Theme.of(context).colorScheme.surface,
                //             border: Border.all(
                //               color: Colors.white.withValues(alpha: 0.4),
                //             ),
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Column(
                //             children: [
                //               SizedBox(height: 5),
                //               Center(
                //                 child: Text(
                //                   "Macro Breakdown",
                //                   style: TextStyle(
                //                     fontSize: 20,
                //                     color: Theme.of(context).colorScheme.onSurface,
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(height: 5),

                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                 children: [
                //                   pfctext("P", 22.0, Alignment.centerLeft, context),
                //                   SizedBox(width: 10),
                //                   pfctext("C", 22.0, Alignment.center, context),
                //                   SizedBox(width: 10),
                //                   pfctext(
                //                     "F",
                //                     22.0,
                //                     Alignment.centerRight,
                //                     context,
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(height: 8),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                 children: [
                //                   pfctext(
                //                     "200g",
                //                     14.0,
                //                     Alignment.centerLeft,
                //                     context,
                //                   ),
                //                   SizedBox(width: 10),
                //                   pfctext("100g", 14.0, Alignment.center, context),
                //                   SizedBox(width: 10),
                //                   pfctext(
                //                     "700g",
                //                     14.0,
                //                     Alignment.centerRight,
                //                     context,
                //                   ),
                //                 ],
                //               ),

                //               // Center(
                //               //   child: Text(
                //               //     "+10%",
                //               //     style: TextStyle(
                //               //       color: const Color.fromARGB(255, 0, 255, 8),
                //               //     ),
                //               //   ),
                //               // ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // )
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "AI - Powred Tools",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                      ? CircularProgressIndicator(backgroundColor: Colors.white)
                      : null,
                ),
                GestureDetector(
                  onTap: () async {
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
                                if (result['result']['foods_identified'] !=
                                    null) ...[
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Sacrificed Foods & Their Yields:',
                                    style: subHeaderStyle,
                                  ),
                                  ...List<Widget>.from(
                                    (result['result']['foods_identified']
                                            as List)
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
                                  "Food Kcal Analyzer With AI",
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
                                    """Click me & Get info about food on plate in for free .""",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
