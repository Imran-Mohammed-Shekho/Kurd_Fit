import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/CommonWidget/resuableProgressIndicator.dart';
import 'package:gym/UI/CommonWidget/show_logOut_Alertt.dart';
import 'package:gym/UI/screens/changePassword_UI/Change_password.dart';
import 'package:gym/UI/screens/landingScreen_UI/LevelScreen.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';
import 'package:gym/UI/screens/about_UI/aboutus_screen.dart';
import 'package:gym/UI/screens/appTheme/custom_colors.dart';
import 'package:gym/UI/screens/drawer_UI/drawer_header.dart';
import 'package:gym/UI/screens/drawer_UI/drawer_listtiles.dart';
import 'package:gym/UI/screens/payment_UI/payment&subscreption_screen.dart';
import 'package:gym/UI/screens/support_screen.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

const languages = ["English", "Kurdish"];

class DrawerSection extends StatefulWidget {
  const DrawerSection({super.key});

  @override
  State<DrawerSection> createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  bool isLoad = false;

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        behavior: SnackBarBehavior.fixed,
        content: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Future<void> _logoutUser() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: reusableProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signOut();
      await Future.delayed(Duration(seconds: 3));
      if (mounted) {
        Navigator.pop(context);
      }
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      _showMessage(e.code, const Color.fromRGBO(244, 67, 54, 1));
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
      }
      _showMessage("$e", const Color.fromRGBO(244, 67, 54, 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    int temIndexLanguage = 0;
    final Themeprovider = context.watch<ThemeProvider>();
    final colors = Theme.of(context).extension<CustomColors>();

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
              color: kwhite.withValues(alpha: 0.06),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              border: Border.all(
                style: BorderStyle.solid,

                color: Colors.white.withValues(alpha: 0.3),
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
            child: ListView(
              children: [
                DrawerHeaderr(),

                ListTiles(
                  Text(
                    "Enabble Notifications ",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.notification_add_rounded,
                    color: Themeprovider.isDark
                        ? Color(0xFFFFD54F)
                        : Color(0xFF4DD0E1),
                  ),
                  () {},
                ),

                ListTiles(
                  Text(
                    "Change password ",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.lock,
                    color: Themeprovider.isDark
                        ? Color(0xFFFF8A65)
                        : Color(0xFFFFAB91),
                  ),
                  () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePassword()),
                    );
                  },
                ),
                Dividers(),

                ListTiles(
                  Text(
                    "Change language",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.language,
                    color: Themeprovider.isDark
                        ? Color(0xFFAB47BC)
                        : Color(0xFFCE93D8),
                  ),
                  () => showCupertinoModalPopup(
                    barrierDismissible: true,

                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),

                          child: Column(
                            children: [
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 35,

                                  onSelectedItemChanged: (value) {
                                    setState(() {
                                      temIndexLanguage = value;
                                    });
                                  },
                                  children: List.generate(languages.length, (
                                    index,
                                  ) {
                                    return Text(
                                      languages[index],
                                      style: TextStyle(color: kwhite),
                                    );
                                  }),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: TextButton(
                                  child: Text(
                                    "Don",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: kwhite,
                                    ),
                                  ),
                                  onPressed: () {
                                    final pro = Provider.of<LanguageProvider>(
                                      context,
                                      listen: false,
                                    );

                                    pro.changeLanguage(temIndexLanguage);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Dividers(),
                ListTiles(
                  Text(
                    "Payment & Subscription",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.payment_outlined,
                    color: Themeprovider.isDark
                        ? Color(0xFFFFB300)
                        : Color(0xFFFFCA28),
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
                ListTiles(
                  Text(
                    "Share App",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.share,
                    color: Themeprovider.isDark
                        ? Color(0xFF64B5F6)
                        : Color(0xFF42A5F5),
                  ),
                  () async => await SharePlus.instance.share(
                    ShareParams(
                      title: "Gym App By Imran Mohammed ",
                      text:
                          'Check out my Gym App! Download it here: https://play.google.com/store/apps/details?id=com.example.gym_app',
                    ),
                  ),
                ),

                Dividers(),
                ListTiles(
                  Text(
                    "Help & Support",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.support_agent,
                    color: Themeprovider.isDark
                        ? Color(0xFFA5D6A7)
                        : Color(0xFF66BB6A),
                  ),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SupportScreen()),
                    );
                  },
                ),

                ListTiles(
                  Text(
                    "About Us",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.info,
                    color: Themeprovider.isDark
                        ? Color(0xFFB39DDB)
                        : Color(0xFFB39DDB),
                  ),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutusScreen()),
                    );
                  },
                ),

                Dividers(),
                ListTiles(
                  Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.logout_rounded,
                    color: Themeprovider.isDark
                        ? Color(0xFFEF9A9A)
                        : Color(0xFFEF5350),
                  ),
                  () {
                    showdLogOutAlert(
                      context: context,
                      title: "Log out?",
                      message:
                          "You will need to sign in again next time.\n Continue?",

                      onLogoutPressed: () async {
                        Navigator.pop(context);
                        _logoutUser();
                      },
                    );
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
