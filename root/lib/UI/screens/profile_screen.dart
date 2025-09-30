import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Dashboard_Screen.dart';
import 'package:gym/UI/screens/Login_screen.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  String name = '';
  String phone = '';
  String email = '';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ClipOval(
                  child: Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        style: BorderStyle.solid,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: AssetImage("lib/assets/images/Ellipse.png"),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: Colors.white, size: 60),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Imran Mohammed ",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Fitness enthusiastic ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GlassyTextField("Name", (value) {
                  setState(() {
                    name = value;
                  });
                }),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GlassyTextField("Email", (value) {
                  setState(() {
                    email = value;
                  });
                }),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GlassyTextField("Phone +964 07", (value) {
                  setState(() {
                    phone = value;
                  });
                }),
              ),
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: dashboradBottom(() {}, "Save changes", Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
