import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/ProgressTracker.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Weightscreen extends StatefulWidget {
  const Weightscreen({super.key});

  @override
  State<Weightscreen> createState() => _WeightscreenState();
}

class _WeightscreenState extends State<Weightscreen> {
  double width = 300;
  int _selectedWeight = 60;
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

            buildQuestionText(text: "What is your Weight?"),
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
                          "💪 Smart Weight Evaluation",
                          style: TextStyle(
                            fontSize: 20,
                            color: kwhite,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Your weight helps us calculate your ideal BMI and generate a precise fitness roadmap.",
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
                  "$_selectedWeight",
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
              flex: 2,
              child: CupertinoPicker(
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                  initialItem:
                      _selectedWeight -
                      30, // conveting selected eight to index becouse cupertno picker uses index instead real value
                ),
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedWeight =
                        value +
                        30; // if value =10 so sleected weight should be 40
                  });
                },
                children: List.generate(
                  121,
                  (index) => Center(
                    child: Text(
                      "${30 + index} kg",
                      style: TextStyle(color: kwhite),
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
