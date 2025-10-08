import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Change_password.dart';
import 'package:gym/UI/screens/Dashboard_Screen.dart';
import 'package:gym/UI/screens/custom_colors.dart';
import 'package:gym/UI/screens/language_screen.dart';
import 'package:gym/state/providers/theme_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class drawer_section extends StatelessWidget {
  const drawer_section({super.key});

  @override
  Widget build(BuildContext context) {
    final Themeprovider = context.watch<ThemeProvider>();
    final colors = Theme.of(context).extension<CustomColors>();
    return Container(
      decoration: BoxDecoration(color: colors?.drawerbg ?? Colors.blue),
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
            () {},
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
            () {},
          ),
        ],
      ),
    );
  }
}
