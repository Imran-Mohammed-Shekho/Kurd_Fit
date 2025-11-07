import 'dart:ui';
import 'package:flutter/material.dart';

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
              height: 200,

              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
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
                              onPressed: onLogoutPressed,
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
