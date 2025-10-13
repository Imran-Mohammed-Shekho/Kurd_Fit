import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Login_screen.dart';
import 'package:gym/UI/screens/check_email.dart';
import 'package:gym/UI/screens/introduction_screen1.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  print("can not rout");
                }
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            Positioned.fill(
              child: Image.asset(
                "lib/assets/images/back2.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 80),
                Column(
                  children: [
                    Text(
                      "Forgot your password?",

                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      """Enter your email below to receive a 
                password reset link.""",

                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: GlassyTextField("Email", (value) {}, 60),
                  ),
                ),
                SizedBox(height: 90),
                IntorductionButtons(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckEmail()),
                    );
                  },
                  "Send",
                  Color(0xff5B58FB),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
