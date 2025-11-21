import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenederListViewOptions.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/ProgressTracker.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Heightscreen extends StatefulWidget {
  const Heightscreen({super.key});

  @override
  State<Heightscreen> createState() => _HeightscreenState();
}

class _HeightscreenState extends State<Heightscreen> {
  double width = 300;
  int selecteHeight = 120;
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

            buildQuestionText(text: "How Tall are you?"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 100,
                width: size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kwhite.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "🧠 AI-Powered BMI Analysis ",
                          style: TextStyle(
                            fontSize: 20,
                            color: kwhite,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Get an accurate Body Mass Index calculation with intelligent insights based on your personal data.",
                          style: TextStyle(fontSize: 14, color: kwhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  "$selecteHeight",
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            buildButtom(
              ontap: () {
                Provider.of<LandingscreenProvider>(
                  context,
                  listen: false,
                ).changeCurrentIndex();
              },
            ),
            SizedBox(height: 30),
            Expanded(
              child: CupertinoPicker(
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                  initialItem: selecteHeight - 100,
                ),
                onSelectedItemChanged: (value) {
                  setState(() {
                    selecteHeight = value + 100;
                  }); // 100–220 cm
                },
                children: List.generate(
                  121,
                  (index) => Center(
                    child: Text(
                      "${index + 100} cm",
                      style: TextStyle(fontSize: 18, color: kwhite),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
