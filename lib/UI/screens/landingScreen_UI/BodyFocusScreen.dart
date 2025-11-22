import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderListTiles.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/ProgressTracker.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Bodyfocusscreen extends StatefulWidget {
  const Bodyfocusscreen({super.key});

  @override
  State<Bodyfocusscreen> createState() => _BodyfocusscreenState();
}

class _BodyfocusscreenState extends State<Bodyfocusscreen> {
  double width = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6157C9),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            buildQuestionText(text: "Choose your focs areas"),

            _buildListViewOptions(
              options: [
                {"title": "Back", "icon": Icons.fitness_center},
                {"title": "Abs", "icon": Icons.fitness_center},
                {"title": "Shoulders", "icon": Icons.fitness_center},
                {"title": "Legs", "icon": Icons.fitness_center},
                {"title": "Chest", "icon": Icons.fitness_center},
                {"title": "Arms", "icon": Icons.fitness_center},
                {"title": "Calves", "icon": Icons.fitness_center},
                {"title": "FullBody", "icon": Icons.fitness_center},
              ],
            ),
            buildButtom(
              ontap: () {
                Provider.of<LandingscreenProvider>(
                  context,
                  listen: false,
                ).changeCurrentIndex();
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _buildListViewOptions extends StatefulWidget {
  final List<Map<String, dynamic>> options;

  const _buildListViewOptions({required this.options});

  @override
  State<_buildListViewOptions> createState() => __buildListViewOptionsState();
}

// ignore: camel_case_types
class __buildListViewOptionsState extends State<_buildListViewOptions> {
  // ignore: non_constant_identifier_names
  List? Selectedindex = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.options.length, (index) {
              final item = widget.options[index];

              return buildListOptions(
                title: item["title"],
                iconData: item["icon"],
                ontap: () => setState(() {
                  //this logic returns selected ture only if the itme has been selected other wise it will be deselected and removed from selected list
                  if (Selectedindex!.contains(index)) {
                    Selectedindex!.remove(index);
                  } else {
                    Selectedindex!.add(index);
                  }
                }),
                isSelected: Selectedindex!.contains(index),
              );
            }),
          ),
        ],
      ),
    );
  }
}
