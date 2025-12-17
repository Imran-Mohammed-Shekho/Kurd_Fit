// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/LevelScreen.dart';
import 'package:gym/core/Utils/browser_mobile.dart';
import 'package:gym/core/Utils/browser_stub.dart';
import 'package:gym/data/models/workout_requestModel.dart';

class Workoutgeneratedresult extends StatelessWidget {
  final WorkoutPlan paln;
  const Workoutgeneratedresult({super.key, required this.paln});

  @override
  Widget build(BuildContext context) {
    void openUrl(String url) {
      // if (kIsWeb) {
      //   openUrlWeb(url);
      // }
      if (Platform.isIOS || Platform.isAndroid) {
        openUrlMobile(url);
      } else {
        openUrlUnSupported();
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Workout plan is ready !",
          style: TextStyle(color: const Color(0xFFFFFFFF), fontSize: 20),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            children: [
              ...paln.split.entries.map(
                (e) => Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        e.key,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      subtitle: Text("${e.value}"),
                    ),
                  ),
                ),
              ),

              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Image.network(
                    paln.imageUrl,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "You can check image on internet follow this link",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  openUrl(paln.imageUrl);
                },
                child: Text(
                  " ${paln.imageUrl}",
                  style: TextStyle(
                    color: kwhite,
                    decoration: TextDecoration.underline,
                    decorationColor: kwhite,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
