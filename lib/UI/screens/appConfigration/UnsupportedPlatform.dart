import 'package:flutter/material.dart';
import 'package:gym/core/Utils/localized_text.dart';

class UnsupportedPlatform extends StatelessWidget {
  const UnsupportedPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          tr(
            context,
            "Sorry, this platform is not supported yet. We’re working on it!",
          ),
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
