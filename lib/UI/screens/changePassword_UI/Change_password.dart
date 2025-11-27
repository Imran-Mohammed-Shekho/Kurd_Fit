import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/glassy_text_F.dart';
import 'package:gym/UI/CommonWidget/resuableProgressIndicator.dart';
import 'package:gym/UI/CommonWidget/show_logOut_Alertt.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/profile_screen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/bottomnavigationbar.dart';
import 'package:gym/UI/screens/drawer_UI/drawer_section.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final dialog = drawer_section();
  String newpassword = '';
  int strengthVaule = 0;
  bool isLoading = false;
  final auth = FirebaseAuth.instance;
  final _currentPassordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPassowrdController = TextEditingController();

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

  Color getColor(int value) {
    switch (value) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.yellow;
      default:
        return Colors.green;
    }
  }

  String getlabel(int strength) {
    switch (strength) {
      case 0:
        return "😢 Weak";
      case 1:
        return "🙂 Normal";
      case 2:
        return "😎 Good !";
      default:
        return "🔥 Strong";
    }
  }

  Future changePassord() async {
    if (_confirmPassowrdController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _currentPassordController.text.isEmpty) {
      showMessage("Please Fill all faileds ", Colors.red);
      return;
    }
    if (_newPasswordController.text != _confirmPassowrdController.text) {
      showMessage("Passords dose not match ❌", Colors.red);
      return;
    }

    if (_newPasswordController.text.length < 6) {
      showMessage("Choose Stronger Password", Colors.red);
      return;
    }
    try {
      setState(() {
        isLoading = true;
      });
      final user = auth.currentUser;
      final cred = EmailAuthProvider.credential(
        email: user!.email!,
        password: _currentPassordController.text.trim(),
      );

      await user.reauthenticateWithCredential(cred);

      if (!mounted) return;

      await user.updatePassword(_newPasswordController.text.trim());
      if (!mounted) return;

      showMessage(
        "Your Password has been updated Please Login again",
        Colors.green,
      );
      showdLogOutAlert(
        context: context,
        title: "Password Changed",
        message: "please try again",
        onLogoutPressed: () async {
          Navigator.pop(context);

          showDialog(
            context: context,
            builder: (context) =>
                Center(child: CircularProgressIndicator(color: Colors.white)),
          );
          await Future.delayed(Duration(seconds: 2));
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      showMessage(e.code, kred);
    } catch (e) {
      showMessage("somthinge went wrong ", kred);
    } finally {}
  }

  void showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.fixed,
        backgroundColor: color,
        content: Row(
          children: [
            Icon(
              color == kred
                  ? Icons.error_rounded
                  : color == Colors.orange
                  ? Icons.warning_amber_rounded
                  : Icons.check_circle_rounded,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late Color color = getColor(strengthVaule);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
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
                  "🔐 Change password".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
                child: _buildlabel("Current Password"),
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GlassyTextField(
                "Enter current password",
                (value) {},
                60,
                _currentPassordController,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: _buildlabel("New Password"),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GlassyTextField(
                "Enter new passowrd",
                (password) {
                  setState(() {
                    strengthVaule = passwordStrength(password);
                  });
                },
                60,
                _newPasswordController,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Expanded(
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(right: i < 2 ? 5 : 0),
                        width: 100,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: strengthVaule > i
                              ? color
                              : Colors.white.withOpacity(0.1),
                          boxShadow: [
                            if (strengthVaule > i)
                              BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 1,
                                color: color.withOpacity(0.6),
                              ),
                          ],
                        ),
                        duration: Duration(milliseconds: 300),
                      ),
                    ),

                  SizedBox(width: 20),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: Text(
                      getlabel(strengthVaule),
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ],
                        color: color,
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
                child: _buildlabel("Confirm new Password "),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GlassyTextField(
                "Confirm new password",
                (value) {},
                60,
                _confirmPassowrdController,
              ),
            ),

            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: isLoading
                  ? Center(child: reusableProgressIndicator())
                  : buildButtom(
                      ontap: () {
                        changePassord();
                      },
                      text: "Change Password",
                      isTrue: false,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildlabel(String label) {
  return Text(label, style: TextStyle(color: Colors.white, fontSize: 14));
}
