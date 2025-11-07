import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Login_screen.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "lib/assets/images/chekemail.png",
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "lib/assets/images/imageR_I.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          Positioned(
            bottom: 200,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  " Check your Email!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  """We’ve Sent  a Password rest link\nto your Email Address . Please Check your Inbox.""",
                  style: TextStyle(
                    color: const Color(0xffB5B5B5).withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 146, 146, 146),
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff5B58FB),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        "Back to Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
