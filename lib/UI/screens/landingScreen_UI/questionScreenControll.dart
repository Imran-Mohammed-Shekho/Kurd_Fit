import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/activityLevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/ProgressTracker.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

class Questionscreencontroll extends StatefulWidget {
  const Questionscreencontroll({super.key});

  @override
  State<Questionscreencontroll> createState() => _QuestionscreencontrollState();
}

class _QuestionscreencontrollState extends State<Questionscreencontroll> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<LandingscreenProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6157C9),
        leading: IconButton(
          onPressed: () {
            provider.decrementIndex();
            if (provider.currentindex == 0) {
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.arrow_back_ios_new, color: kwhite),
        ),
      ),
      backgroundColor: Color(0xff6157C9),
      body: Column(
        children: [
          buildProgressTracker(size: size),
          Expanded(flex: 6, child: provider.pages[provider.currentindex]),
        ],
      ),
    );
  }
}
