import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gym/state/providers/workout_provider.dart';
import 'package:provider/provider.dart';

class WorkoutDetail extends StatefulWidget {
  final String imageurl;
  final String name;
  final String targetMuscles;
  final String bodyParts;
  final String equipments;
  final String secondaryMuscles;
  final String instructions;

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
    final info = Provider.of<MangeWorkoutsPorovider>(context);
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
                              Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Workout info",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),

                                  Text("${widget.name}"),
                                  Text("${widget.bodyParts}"),
                                  Text("${widget.equipments}"),
                                  Text("${widget.targetMuscles}"),
                                  Text("${widget.secondaryMuscles}"),
                                  Text("${widget.instructions}"),
                                ],
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
