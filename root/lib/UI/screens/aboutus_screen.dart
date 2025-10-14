import 'dart:ui';

import 'package:flutter/material.dart';

class AboutusScreen extends StatefulWidget {
  const AboutusScreen({super.key});

  @override
  State<AboutusScreen> createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/Nutback.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        aboutuscontiners(
                          "Our Mission",
                          """At Kurd Fit, our mission is to empower individuals across Kurdistan and beyond to live healthier, stronger, and more confident lives. We strive to make fitness accessible to everyone—whether you’re just starting your journey or pushing toward new personal bests. Through expert guidance, personalized workout plans, nutrition support, and a strong sense of community, we are dedicated to building a culture of health, resilience, and self-improvement. Kurd Fit is more than just a gym app—it’s your partner in unlocking your full potential.""",
                          310,
                        ),

                        SizedBox(height: 20),
                        aboutuscontiners(
                          "Our History",
                          """Kurd Fit was born from a simple idea: to bring world-class fitness tools to the people of Kurdistan in a way that feels local, accessible, and inspiring. Founded by a team of passionate trainers and developers, the app was created to close the gap between traditional gyms and modern digital fitness solutions.
 From the beginning, our vision was clear—make fitness guidance available anytime, anywhere. We started small, offering basic workout tracking and nutrition advice, but quickly grew into a comprehensive fitness platform that supports every stage of the fitness journey.
Today, Kurd Fit stands as the first homegrown fitness app dedicated to empowering our community with cutting-edge technology, cultural pride, and a shared commitment to healthier living. And this is just the beginning.""",
                          500,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class aboutuscontiners extends StatelessWidget {
  final String title;
  final String subtitle;
  final double height;
  const aboutuscontiners(this.title, this.subtitle, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: height,
            width: double.infinity,

            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(color: Colors.white.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      textAlign: TextAlign.left,
                      subtitle,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
