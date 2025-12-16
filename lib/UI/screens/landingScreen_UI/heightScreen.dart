import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
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
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<LandingscreenProvider>();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            buildQuestionText(text: "How Tall are you?"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: size.height * 0.12,
                width: size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kwhite.withValues(alpha: 0.2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: SingleChildScrollView(
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
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  "${prov.selecteHeight}",
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            buildButtom(
              ontap: () {
                prov.setHeight(prov.selecteHeight);
                if (prov.height != null) {
                  prov.changeCurrentIndex();
                }
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
                      .getinitialItem(), // conveting selected height to index becouse cupertno picker uses index instead real value
                ),
                onSelectedItemChanged: (value) {
                  prov.setCurrentHeight(value);
                },
                children: List.generate(
                  121,
                  (index) => Center(
                    child: Text(
                      "${100 + index} cm",
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
