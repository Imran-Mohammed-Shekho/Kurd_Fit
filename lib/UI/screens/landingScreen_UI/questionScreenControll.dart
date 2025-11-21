import 'package:flutter/material.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

class Questionscreencontroll extends StatefulWidget {
  const Questionscreencontroll({super.key});

  @override
  State<Questionscreencontroll> createState() => _QuestionscreencontrollState();
}

class _QuestionscreencontrollState extends State<Questionscreencontroll> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LandingscreenProvider>(context, listen: true);
    return Scaffold(body: provider.pages[provider.currentindex]);
  }
}
