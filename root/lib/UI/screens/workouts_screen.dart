import 'dart:ui';

import 'package:flutter/material.dart';

List<Map<String, String>> workouts = [
  {
    "title": "ARM",
    "number": "20x  workouts",
    "image": "lib/assets/images/arms.png",
  },
  {
    "title": "OBLIQUES",
    "number": "30x  workouts",
    "image": "lib/assets/images/OBLIQUES.png",
  },
  {
    "title": "FOREARMS",
    "number": "22x  workouts",
    "image": "lib/assets/images/FOREARMS.png",
  },
  {
    "title": "CALVES",
    "number": "10x  workouts",
    "image": "lib/assets/images/calves.png",
  },
  {
    "title": "QUADS",
    "number": "40x  workouts",
    "image": "lib/assets/images/quads.png",
  },
  {
    "title": "TRICEPS",
    "number": "34x  workouts",
    "image": "lib/assets/images/TRICEPS.png",
  },
  {
    "title": "SHOULDERS",
    "number": "10x workouts",
    "image": "lib/assets/images/SHOULDERS.png",
  },
  {
    "title": "BACK",
    "number": "20x  workouts",
    "image": "lib/assets/images/back.png",
  },
  {
    "title": "ABS",
    "number": "18x  workouts",
    "image": "lib/assets/images/abs.png",
  },
  {
    "title": "LEGS",
    "number": "22x  workouts",
    "image": "lib/assets/images/legs.png",
  },
];

class Workouts_Screen extends StatefulWidget {
  const Workouts_Screen({super.key});

  @override
  State<Workouts_Screen> createState() => _Workouts_ScreenState();
}

class _Workouts_ScreenState extends State<Workouts_Screen> {
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
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Image.asset(
                      "lib/assets/images/man.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 100),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "Workouts",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(
                                workouts[index]["title"] ?? "unkown",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              subtitle: Text(
                                workouts[index]["number"] ?? "0x",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              leading: Image.asset(
                                workouts[index]["image"] ??
                                    "the image dos not load",
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
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
    );
  }
}
