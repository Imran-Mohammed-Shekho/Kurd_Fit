import 'package:flutter/material.dart';

class App_Shop extends StatefulWidget {
  const App_Shop({super.key});

  @override
  State<App_Shop> createState() => _App_ShopState();
}

class _App_ShopState extends State<App_Shop> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(children: [

          ],
        ),
        ),
      ),
    );
  }
}
