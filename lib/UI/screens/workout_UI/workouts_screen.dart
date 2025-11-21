import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/state/providers/workout_provider.dart';
import 'package:gym/UI/screens/workout_UI/workouts_show.dart';

import 'package:provider/provider.dart';

List<Map<String, String>> workouts = [
  {"title": "NECK", "image": "assets/images/neck.png"},
  {"title": "FOREARMS", "image": "assets/images/FOREARMS.png"},
  {"title": "SHOULDERS", "image": "assets/images/SHOULDERS.png"},
  {"title": "CARDIO", "image": "assets/images/cardio.png"},
  {"title": "UPPER ARMS", "image": "assets/images/arms.png"},
  {"title": "CHEST", "image": "assets/images/chest.png"},
  {"title": "Calves", "image": "assets/images/calves.png"},
  {"title": "BACK", "image": "assets/images/back.png"},
  {"title": "UPPER LEGS", "image": "assets/images/legs.png"},
  {"title": "WAIST", "image": "assets/images/abs.png"},
];

class Workouts_Screen extends StatefulWidget {
  const Workouts_Screen({super.key});

  @override
  State<Workouts_Screen> createState() => _Workouts_ScreenState();
}

class _Workouts_ScreenState extends State<Workouts_Screen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bodypartsObject = Provider.of<MangeWorkoutsPorovider>(
        context,
        listen: false,
      );
      if (bodypartsObject.BodyParts.isEmpty &&
          !bodypartsObject.isloadBodyParts) {
        bodypartsObject.fetchBodyparts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<MangeWorkoutsPorovider>(
          builder: (context, value, child) {
            if (value.isloadBodyParts) {
              return Center(child: CircularProgressIndicator());
            } else if (value.BodyParts.isEmpty) {
              return Center(child: Text("no data found "));
            } else {
              return Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Nutback.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Image.asset(
                            "assets/images/man.png",
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SizedBox(width: 85),
                        Text(
                          "Body Parts",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.BodyParts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 15,
                                  sigmaX: 15,
                                ),
                                child: SizedBox(
                                  height: 80,
                                  width: double.infinity,

                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: 0.1,
                                      ),
                                      border: Border.all(
                                        color: Colors.white.withValues(
                                          alpha: 0.4,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        final workout =
                                            Provider.of<MangeWorkoutsPorovider>(
                                              context,
                                              listen: false,
                                            );
                                        workout.ChangeSelecetedWorkout(
                                          value.BodyParts[index]["name"],
                                        );
                                        workout.TargetExercises.clear();
                                        workout.FetchTargetExercises(
                                          workout.SelectedWorkOut,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WorkoutsShow(),
                                          ),
                                        );
                                      },
                                      title: Text(
                                        "${workouts[index]["title"]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white54,
                                        ),
                                      ),
                                      leading: Image.asset(
                                        "${workouts[index]["image"]}",
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 15),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
