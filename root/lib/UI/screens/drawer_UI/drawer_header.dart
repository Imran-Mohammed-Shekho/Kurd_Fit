import 'package:flutter/material.dart';
import 'package:gym/UI/screens/profile_screen.dart';

class DrawerHeaderr extends StatelessWidget {
  const DrawerHeaderr({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile_Screen()),
          ),
          child: Icon(Icons.person, color: Colors.white, size: 100),
        ),
      ),
    );
  }
}
