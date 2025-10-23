import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/Nutitrion_Screen.dart';
import 'package:gym/UI/screens/drawer_section.dart';

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

            Positioned(
              top: 150,
              right: 10,
              left: 35,
              child: Row(
                children: [
                  GlassyContainer("Calories", "200g"),
                  SizedBox(width: 20),
                  GlassyContainer("Workout Streak", "7"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 280, horizontal: 30),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                pfctext(
                                  "P",
                                  22.0,
                                  Alignment.centerLeft,
                                  context,
                                ),
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
                                pfctext(
                                  "100g",
                                  14.0,
                                  Alignment.center,
                                  context,
                                ),
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 600),
                      pageBuilder:
                          (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                          ) {
                            return FadeThroughTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              child: Nutitrion_Screen(),
                            );
                          },
                    ),
                  );
                },
                child: SizedBox(
                  height: 100,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
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
            ),
          ],
        ),
      ),
    );
  }
}
