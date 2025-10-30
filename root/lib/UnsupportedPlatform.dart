import 'package:flutter/material.dart';

class UnsupportedPlatform extends StatelessWidget {
  const UnsupportedPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Sorry, this platform is not supported yet. We’re working on it!",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
