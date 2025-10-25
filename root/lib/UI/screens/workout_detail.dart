import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gym/state/providers/workout_provider.dart';
import 'package:provider/provider.dart';

const style = TextStyle(color: Colors.white);

class WorkoutDetail extends StatefulWidget {
  final String imageurl;
  final String name;
  final String targetMuscles;
  final String bodyParts;
  final String equipments;
  final String secondaryMuscles;
  final List<dynamic> instructions;

  const WorkoutDetail(
    this.imageurl,
    this.name,
    this.targetMuscles,
    this.equipments,

    this.bodyParts,
    this.secondaryMuscles,
    this.instructions, {
    super.key,
  });

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    "${widget.imageurl}",
                    width: double.infinity,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  height: size.height * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),

                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(height: 15),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Workout Details",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    Text("Name : ${widget.name}", style: style),
                                    SizedBox(height: 10),
                                    Text(
                                      "Body Part : ${widget.bodyParts}",
                                      style: style,
                                    ),
                                    SizedBox(height: 10),

                                    Text(
                                      "Equipments: ${widget.equipments}",
                                      style: style,
                                    ),
                                    SizedBox(height: 10),

                                    Text(
                                      "TargetMuscles: ${widget.targetMuscles}",
                                      style: style,
                                    ),
                                    SizedBox(height: 10),

                                    Text(
                                      "SecondaryMuscles: ${widget.secondaryMuscles}",
                                      style: style,
                                    ),
                                    SizedBox(height: 10),

                                    Text(
                                      "Instructions:\n${widget.instructions[0]}",
                                      style: style,
                                    ),
                                    Text(
                                      "\n${widget.instructions[1]}",
                                      style: style,
                                    ),

                                    Text(
                                      "\n${widget.instructions[2] ?? "null"}",
                                      style: style,
                                    ),
                                    Text(
                                      "\n${widget.instructions[3] ?? "null"}",
                                      style: style,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
