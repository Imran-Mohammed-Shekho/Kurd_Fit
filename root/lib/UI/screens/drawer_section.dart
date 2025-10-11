import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Change_password.dart';
import 'package:gym/UI/screens/Dashboard_Screen.dart';
import 'package:gym/UI/screens/Login_screen.dart';
import 'package:gym/UI/screens/custom_colors.dart';
import 'package:gym/UI/screens/language_screen.dart';
import 'package:gym/UI/screens/payment&subscreption_screen.dart';
import 'package:gym/state/providers/general_provider.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class drawer_section extends StatelessWidget {
  const drawer_section({super.key});

  @override
  Widget build(BuildContext context) {
    final Themeprovider = context.watch<ThemeProvider>();
    final colors = Theme.of(context).extension<CustomColors>();
    bool islogout = false;

    Future _showdialog() {
      return showDialog(
        barrierDismissible: true,

        animationStyle: AnimationStyle(
          curve: Curves.easeOut,
          duration: Duration(milliseconds: 300),
        ),

        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(20),
            content: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                child: SizedBox(
                  height: 200,

                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "are u sure you to logout ?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "if you tap on red button you will be \nsign out all pages & you need\nto login agin! ",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.redAccent,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 100,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.green,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      "cancel",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors?.drawerbg ?? Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              border: Border.all(
                style: BorderStyle.solid,

                color: Colors.white,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Icon(Icons.person, color: Colors.white, size: 100),
                  ),
                ),

                listTiles(
                  Text(
                    "Enabble Notifications ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.notification_add_rounded,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () {},
                ),

                listTiles(
                  Text(
                    "Change password ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.lock,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        reverseDuration: Duration(milliseconds: 600),
                        duration: Duration(milliseconds: 600),
                        child: Change_password(),
                      ),
                    );
                  },
                ),
                dividers(),

                listTiles(
                  Text(
                    "Change language",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.language,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () => showmodelbottomsheet(context),
                ),
                listTiles(
                  Text(
                    "Change Theme",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Themeprovider.isDark ? Icons.light_mode : Icons.dark_mode,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () {
                    Themeprovider.chnagetheme();
                  },
                ),
                dividers(),
                listTiles(
                  Text(
                    "Payment & Subscription",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.payment_outlined,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentsubscreptionScreen(),
                      ),
                    );
                  },
                ),
                listTiles(
                  Text(
                    "Share App",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.share,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () {},
                ),

                dividers(),
                listTiles(
                  Text(
                    "Help & Support",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.support_agent,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () {},
                ),

                listTiles(
                  Text(
                    "About Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.info,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () {},
                ),

                dividers(),
                listTiles(
                  Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.logout_rounded,
                    color: Themeprovider.isDark ? Colors.white : Colors.black,
                  ),
                  () async {
                    islogout = await GeneralProvider().logoutuser();
                    if (islogout) {
                      _showdialog();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
