import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/CommonWidget/show_logOut_Alertt.dart';
import 'package:gym/UI/screens/changePassword_UI/Change_password.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';
import 'package:gym/UI/screens/about_UI/aboutus_screen.dart';
import 'package:gym/UI/screens/about_UI/custom_colors.dart';
import 'package:gym/UI/screens/drawer_UI/drawer_header.dart';
import 'package:gym/UI/screens/drawer_UI/drawer_listtiles.dart';
import 'package:gym/UI/screens/drawer_UI/language_screen.dart';
import 'package:gym/UI/screens/payment_UI/payment&subscreption_screen.dart';
import 'package:gym/UI/screens/support_screen.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class drawer_section extends StatefulWidget {
  const drawer_section({super.key});

  @override
  State<drawer_section> createState() => _drawer_sectionState();
}

class _drawer_sectionState extends State<drawer_section> {
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
      builder: (context) =>
          Center(child: CircularProgressIndicator(color: Colors.white)),
    );
    try {
      await FirebaseAuth.instance.signOut();
      await Future.delayed(Duration(seconds: 3));
      if (mounted) {
        Navigator.pop(context);
      }
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      _showMessage(e.code, const Color.fromRGBO(244, 67, 54, 1));
    } catch (e) {
      _showMessage("$e", const Color.fromRGBO(244, 67, 54, 1));
    } finally {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                DrawerHeaderr(),

                ListTiles(
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
                    color: Themeprovider.isDark
                        ? Color(0xFFFFD54F)
                        : Color(0xFF4DD0E1),
                  ),
                  () {},
                ),

                ListTiles(
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
                    color: Themeprovider.isDark
                        ? Color(0xFFFF8A65)
                        : Color(0xFFFFAB91),
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
                Dividers(),

                ListTiles(
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
                    color: Themeprovider.isDark
                        ? Color(0xFFAB47BC)
                        : Color(0xFFCE93D8),
                  ),
                  () => showmodelbottomsheet(context),
                ),
                ListTiles(
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
                    color: Themeprovider.isDark
                        ? Color(0xFF9CCC65)
                        : Color(0xFFC5E1A5),
                  ),
                  () {
                    Themeprovider.changeTheme();
                  },
                ),
                Dividers(),
                ListTiles(
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
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
                      title: "log out",
                      message: "Are sure you want to logout ?",

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
