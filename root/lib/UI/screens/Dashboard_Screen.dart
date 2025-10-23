import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: Theme.of(context).colorScheme.background,
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

            Positioned(top: 10, left: 25, right: 10, child: kurdfittext()),
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
                  glassycontainer("Calories", "200g"),
                  SizedBox(width: 20),
                  glassycontainer("Workout Streak", "7"),
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
                            color: Colors.white.withOpacity(0.4),
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
                                Pfctext("P", 22, Alignment.centerLeft, context),
                                SizedBox(width: 10),
                                Pfctext("C", 22, Alignment.center, context),
                                SizedBox(width: 10),
                                Pfctext(
                                  "F",
                                  22,
                                  Alignment.centerRight,
                                  context,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Pfctext(
                                  "200g",
                                  14,
                                  Alignment.centerLeft,
                                  context,
                                ),
                                SizedBox(width: 10),
                                Pfctext("100g", 14, Alignment.center, context),
                                SizedBox(width: 10),
                                Pfctext(
                                  "700g",
                                  14,
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
                              color: Colors.black.withOpacity(0.2),
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
                                  color: Colors.white.withOpacity(0.6),
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
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.1),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
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

class dividers extends StatelessWidget {
  const dividers({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.white54, endIndent: 5, indent: 5);
  }
}

class listTiles extends StatelessWidget {
  final Widget title;
  final Widget icon;
  final VoidCallback ontap;

  const listTiles(this.title, this.icon, this.ontap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: ontap,
      leading: icon,
    );
  }
}

class kurdfittext extends StatelessWidget {
  const kurdfittext({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Kurd  Fit",
      style: GoogleFonts.pacifico(
        color: Colors.white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class dashboradBottom extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final Color color;
  final bool isload;
  const dashboradBottom(
    this.ontap,
    this.text,
    this.color,
    this.isload, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        width: 350,
        height: 60,

        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xff727bff),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white.withOpacity(0.4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 0),
              Padding(
                padding: const EdgeInsets.only(),
                child: isload
                    ? CircularProgressIndicator(
                        color: Colors.blue,
                        strokeWidth: 3,
                      )
                    : Text(
                        text,
                        style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
              ),
              Padding(
                padding: text == "Start Wokrout"
                    ? const EdgeInsets.only(right: 10)
                    : EdgeInsets.all(0),
                child: text == "Start Workout"
                    ? Icon(Icons.arrow_forward_ios, color: Colors.black)
                    : SizedBox(width: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Pfctext(text, alignment, fontsize, BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}

class glassycontainer extends StatelessWidget {
  late final String title;
  late final String subtitle;

  glassycontainer(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: SizedBox(
          height: 100,
          width: 170,

          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(color: Colors.white.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(height: 5),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    "+10%",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 255, 8),
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
