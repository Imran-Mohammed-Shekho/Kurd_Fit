import 'package:flutter/material.dart';
import 'package:gym/state/providers/appState_Provider.dart';
import 'package:provider/provider.dart';

class DrawerHeaderr extends StatelessWidget {
  const DrawerHeaderr({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Provider.of<AppstateProvider>(
          context,
          listen: false,
        ).updatePageState(3),
        child: Icon(Icons.person, color: Colors.white, size: 100),
      ),
    );
  }
}
