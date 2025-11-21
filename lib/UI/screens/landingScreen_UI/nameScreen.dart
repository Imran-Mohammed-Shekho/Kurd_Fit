import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/ProgressTracker.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Namescreen extends StatefulWidget {
  const Namescreen({super.key});

  @override
  State<Namescreen> createState() => _NamescreenState();
}

class _NamescreenState extends State<Namescreen> {
  double width = 300;
  String _name = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6157C9),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            buildProgressTracker(size: size),

            Expanded(
              flex: 2,
              child: buildQuestionText(text: "What is your Name?"),
            ),

            Expanded(
              flex: 4,
              child: TextField(
                onChanged: (value) => setState(() {
                  _name = value;
                }),
                keyboardType: TextInputType.name,
                cursorColor: kwhite,
                cursorHeight: 60,
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20),

            buildButtom(
              ontap: () {
                Provider.of<LandingscreenProvider>(
                  context,
                  listen: false,
                ).changeCurrentIndex();
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
