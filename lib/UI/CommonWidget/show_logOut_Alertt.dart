import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/profile_screen.dart';

Future showdLogOutAlert({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback? onLogoutPressed,

  String logoutText = "Logout",
  String cancelText = "Cancel",
}) {
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
              height: 150,

              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          message,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: title == "Password Changed"
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 100,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(kred),
                                ),
                                onPressed: onLogoutPressed,
                                child: Center(
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            title == "Password Changed"
                                ? SizedBox()
                                : SizedBox(
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
        ),
      );
    },
  );
}
