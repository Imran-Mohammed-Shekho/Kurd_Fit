// ignore: file_names
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/UI/screens/login&SignUP_UI/SignUp_screen.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Workoutsdaysinweekscreen extends StatefulWidget {
  const Workoutsdaysinweekscreen({super.key});

  @override
  State<Workoutsdaysinweekscreen> createState() =>
      _WorkoutsdaysinweekscreenState();
}

class _WorkoutsdaysinweekscreenState extends State<Workoutsdaysinweekscreen> {
  double width = 300;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = context.watch<LandingscreenProvider>();
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            buildQuestionText(
              text: "How often would you like to \n                 workout ?",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 100,
                width: size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kwhite.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "🔥 Train Smarter, Not Harder ",
                          style: TextStyle(
                            fontSize: 20,
                            color: kwhite,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Choose how often you want to work out and we’ll adjust intensity for maximum results.",
                          style: TextStyle(fontSize: 14, color: kwhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "${prov.getSelectedWorkoutsDay}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: kwhite,
              ),
            ),

            Text(
              "${prov.workoutsPerWeek} workout a week",
              style: TextStyle(fontSize: 20, color: kwhite),
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTickMarkColor: Colors.white,
                  inactiveTickMarkColor: Colors.grey,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                  tickMarkShape: RoundSliderTickMarkShape(
                    tickMarkRadius: (width < 500 || height < 700) ? 5 : 10,
                  ),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 35),
                  overlayColor: kwhite.withValues(alpha: 0.3),
                  thumbColor: kwhite,
                  inactiveTrackColor: kwhite.withValues(alpha: 0.2),
                  activeTrackColor: kwhite,
                ),
                child: Slider(
                  divisions: 6,
                  max: 7,
                  min: 1,

                  value: prov.getSelectedWorkoutsDay,
                  onChanged: (value) {
                    prov.setWorkoutsPerWeek(value);
                  },
                ),
              ),
            ),
            buildButtom(
              ontap: () async {
                prov.setWorkoutsPerWeek(prov.workoutsPerWeek);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
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
