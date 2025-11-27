import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/resuableProgressIndicator.dart';
import 'package:gym/UI/screens/landingScreen_UI/ageScreen.dart';
import 'package:gym/state/providers/workout_provider.dart';
import 'package:gym/UI/screens/workout_UI/workout_detail.dart';

import 'package:provider/provider.dart';

class WorkoutsShow extends StatefulWidget {
  const WorkoutsShow({super.key});

  @override
  State<WorkoutsShow> createState() => _WorkoutsShow();
}

class _WorkoutsShow extends State<WorkoutsShow> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final targetexercise = Provider.of<MangeWorkoutsPorovider>(
        context,
        listen: false,
      );
      if (targetexercise.TargetExercises.isEmpty &&
          !targetexercise.isLoadTargetExercises) {
        targetexercise.FetchTargetExercises(targetexercise.SelectedWorkOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<MangeWorkoutsPorovider>(
        builder: (BuildContext context, MangeWorkoutsPorovider value, Widget? child) {
          if (value.isLoadTargetExercises) {
            return Center(child: reusableProgressIndicator());
          } else if (value.TargetExercises.isEmpty) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: Center(child: Text("No data found")),
            );
          } else {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  textAlign: TextAlign.center,
                  "${value.SelectedWorkOut} workouts".toUpperCase(),
                  style: TextStyle(fontSize: 18, color: kwhite),
                ),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: kwhite),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.TargetExercises.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                              child: SizedBox(
                                height: 80,
                                width: double.infinity,

                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    border: Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WorkoutDetail(
                                          value
                                              .TargetExercises[index]["gifUrl"],
                                          value.TargetExercises[index]["name"],
                                          value
                                              .TargetExercises[index]["targetMuscles"][0],
                                          value
                                              .TargetExercises[index]["equipments"][0],
                                          value
                                              .TargetExercises[index]["bodyParts"][0],
                                          value
                                              .TargetExercises[index]["secondaryMuscles"][0],
                                          value
                                              .TargetExercises[index]["instructions"],
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      value.TargetExercises[index]["name"]
                                          .toString()
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "10x",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white54,
                                      ),
                                    ),
                                    leading: SizedBox(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Image.network(
                                          "${value.TargetExercises[index]["gifUrl"]}",
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Icon(
                                                  Icons.fitness_center,
                                                  color: kwhite,
                                                );
                                              },
                                        ),
                                      ),
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
    );
  }
}
