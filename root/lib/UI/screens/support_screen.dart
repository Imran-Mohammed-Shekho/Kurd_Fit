import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/Dashboard_Screen.dart';
import 'package:gym/UI/screens/Login_screen.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  String name = '';
  String email = '';
  String usermessage = '';
  bool isload = false;

  void _validate() {
    if (name.isEmpty || email.isEmpty || usermessage.isEmpty) {
      _showerror("fill all text boxes please! ");
      return;
    } else {
      setState(() {
        isload = true;
      });
    }
  }

  void _showerror(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/Nutback.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: [
                SizedBox(height: 10),

                Center(
                  child: Text(
                    "We are here to help!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Have Questions or Need Assistance ?\nReach Out To Us!",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GlassyTextField(
                    "Name ",
                    (value) => setState(() {
                      name = value;
                    }),
                    60,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GlassyTextField(
                    "Email ",
                    (value) => setState(() {
                      email = value;
                    }),
                    60,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GlassyTextField(
                    "write your problem here...",
                    (value) => setState(() {
                      usermessage = value;
                    }),
                    120,
                  ),
                ),
                SizedBox(height: 30),

                DashboradBottom(
                  () => _validate(),
                  "submit",
                  Colors.white,
                  isload,
                ),
                SizedBox(height: 50),
                Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white.withValues(alpha: 0.3),
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Or",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white.withValues(alpha: 0.3),
                          endIndent: 10,
                          indent: 10,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    "Also You can Find Us here",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    social("lib/assets/images/facebook.png"),
                    SizedBox(width: 30),
                    social("lib/assets/images/twitter.png"),
                    SizedBox(width: 30),
                    social("lib/assets/images/gmail.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class social extends StatelessWidget {
  final String path;
  const social(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,

      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.3),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Image.asset(path, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
