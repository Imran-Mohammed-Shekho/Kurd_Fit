import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/appConfigration/AuthGate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthGate()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset("assets/icons/sp.png", height: 400),
                ),
              ),

              Spacer(),
              Text(
                "Kurd Fitness",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),

              Text(
                "Version 1.0",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
