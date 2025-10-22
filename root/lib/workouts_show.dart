import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/state/providers/workout_provider.dart';
import 'package:gym/workout_detail.dart';
import 'package:gym/workoutsType.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Consumer<MangeWorkoutsPorovider>(
            builder:
                (
                  BuildContext context,
                  MangeWorkoutsPorovider value,
                  Widget? child,
                ) => value.isLoadTargetExercises
                ? Center(child: CircularProgressIndicator())
                : value.TargetExercises.isEmpty
                ? Center(child: Text("NO data found "))
                : Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                          SizedBox(width: 50),
                          Text(
                            textAlign: TextAlign.center,
                            "${value.SelectedWorkOut} workouts",
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
                          itemCount: value.TargetExercises.length,
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
                                        color: Colors.white.withOpacity(0.1),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.4),
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
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          value.TargetExercises[index]["name"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          WTYPES[index].number,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white54,
                                          ),
                                        ),
                                        leading: Image.asset(
                                          WTYPES[index].path,
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
          ),
        ),
      ),
    );
  }
}
