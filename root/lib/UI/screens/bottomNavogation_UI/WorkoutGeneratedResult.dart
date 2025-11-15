// ignore: file_names
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym/core/Utils/browser_mobile.dart';
import 'package:gym/core/Utils/browser_stub.dart';
import 'package:gym/core/Utils/browser_web.dart';
import 'package:gym/data/models/workout_requestModel.dart';

class Workoutgeneratedresult extends StatelessWidget {
  final WorkoutPlan paln;
  const Workoutgeneratedresult({super.key, required this.paln});

  @override
  Widget build(BuildContext context) {
    void openUrl(String url) {
      if (kIsWeb) {
        openUrlWeb(url);
      } else if (Platform.isIOS || Platform.isAndroid) {
        openUrlMobile(url);
      } else {
        openUrlUnSupported();
      }
    }

    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Workout plan is ready !",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ...paln.split.entries.map(
                    (e) => Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            "${e.key}",
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
                      child: Image.network(paln.imageUrl),
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
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
