import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Agescreen extends StatefulWidget {
  const Agescreen({super.key});

  @override
  State<Agescreen> createState() => _AgescreenState();
}

class _AgescreenState extends State<Agescreen> {
  double width = 300;
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<LandingscreenProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6157C9),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            buildQuestionText(text: "How old are you?"),
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
                          "⚡ AI Fitness Intelligence ",
                          style: TextStyle(
                            fontSize: 20,
                            color: kwhite,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Our system uses smart algorithms to understand your body data and optimize your results.",
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
                  "${prov.selectedAge}",
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
                prov.setAge(prov.selectedAge);
                prov.changeCurrentIndex();
              },
              text: "Contine",
              isTrue: true,
            ),
            SizedBox(height: 30),
            Expanded(
              flex: 2,
              child: CupertinoPicker(
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                  initialItem: prov
                      .getinitialItemAge(), // conveting selected eight to index becouse cupertno picker uses index instead real value
                ),
                onSelectedItemChanged: (value) {
                  prov.setCurrentAge(value);
                },
                children: List.generate(
                  87,
                  (index) => Center(
                    child: Text(
                      "${14 + index} years",
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
