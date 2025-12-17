import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenederListViewOptions.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class GenderSecreen extends StatefulWidget {
  const GenderSecreen({super.key});

  @override
  State<GenderSecreen> createState() => _GenderSecreenState();
}

class _GenderSecreenState extends State<GenderSecreen> {
  double width = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            buildQuestionText(text: "What is your gender?"),
            buildListViewOptions(
              options: [
                {"title": "Male", "icon": Icons.male},
                {"title": "Female", "icon": Icons.female},
                {"title": "Other", "icon": Icons.transgender},
              ],

              onselect: (value) {
                final pro = context.read<LandingscreenProvider>();
                pro.setGender(value);
              },
              typeKey: "gender",
            ),
            buildButtom(
              ontap: () {
                final provider = Provider.of<LandingscreenProvider>(
                  context,
                  listen: false,
                );

                if (provider.gender.isNotEmpty) {
                  provider.changeCurrentIndex();
                }
              },
              text: "Contine",
              isTrue: true,
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
