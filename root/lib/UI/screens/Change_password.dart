import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/bottomnavigationbar.dart';

class Change_password extends StatefulWidget {
  const Change_password({super.key});

  @override
  State<Change_password> createState() => _Change_passwordState();
}

class _Change_passwordState extends State<Change_password> {
  String newpassword = '';
  int strengthVaule = 0;

  int passwordStrength(String password) {
    int strength = 0;
    if (password.isEmpty) return strength;
    if (password.length < 6) return strength;
    if (password.length >= 6) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    if (RegExp(r'[@#$%^&*()<>?<>!]').hasMatch(password)) strength++;

    return strength;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Bottomnavigationbar(),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),

                  Text(
                    "🔐 Change password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        BoxShadow(
                          blurRadius: 8,
                          spreadRadius: 1,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Current Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GlassyTextField(
                  "Enter current password",
                  (value) {},
                  60,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GlassyTextField("Enter new passowrd", (password) {
                  setState(() {
                    strengthVaule = passwordStrength(password);
                  });
                }, 60),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    AnimatedContainer(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: strengthVaule == 0
                            ? Colors.red
                            : strengthVaule == 1
                            ? Colors.orange
                            : strengthVaule == 2
                            ? Colors.yellow
                            : strengthVaule >= 3
                            ? Colors.green
                            : Colors.red,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 1,
                            color: strengthVaule == 0
                                ? Colors.red.withOpacity(0.6)
                                : strengthVaule == 1
                                ? Colors.orange.withOpacity(0.6)
                                : strengthVaule == 2
                                ? Colors.yellow.withOpacity(0.6)
                                : strengthVaule >= 3
                                ? Colors.green.withOpacity(0.6)
                                : Colors.transparent,
                          ),
                        ],
                      ),
                      duration: Duration(milliseconds: 300),
                    ),
                    SizedBox(width: 10),
                    AnimatedContainer(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: strengthVaule == 2
                            ? Colors.yellow
                            : strengthVaule >= 3
                            ? Colors.green
                            : Colors.white.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 1,
                            color: strengthVaule == 2
                                ? Colors.yellow.withOpacity(0.6)
                                : strengthVaule >= 3
                                ? Colors.green.withOpacity(0.6)
                                : Colors.transparent,
                          ),
                        ],
                      ),
                      duration: Duration(milliseconds: 300),
                    ),
                    SizedBox(width: 10),
                    AnimatedContainer(
                      curve: Curves.easeInOut,
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: strengthVaule >= 3
                            ? Colors.green
                            : Colors.white.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                            color: strengthVaule >= 3
                                ? Colors.green.withOpacity(0.6)
                                : Colors.transparent,
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      duration: Duration(milliseconds: 300),
                    ),
                    SizedBox(width: 20),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      child: Text(
                        strengthVaule == 0
                            ? "😢 Weak"
                            : strengthVaule == 1
                            ? "🙂 Normal"
                            : strengthVaule == 2
                            ? "😎 Good !"
                            : strengthVaule >= 3
                            ? "🔥 Strong"
                            : "",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ],
                          color: strengthVaule == 0
                              ? Colors.red
                              : strengthVaule == 1
                              ? Colors.orange
                              : strengthVaule == 2
                              ? Colors.yellow
                              : strengthVaule >= 3
                              ? Colors.green
                              : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      transitionBuilder: (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm passowrd",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GlassyTextField("Confirm new password", (value) {}, 60),
              ),

              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: DashboradBottom(
                  () {},
                  "Change passowrd",
                  Colors.white,
                  false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
