import 'package:flutter/material.dart';

AppBar reusableAppbar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
    ),

    title: Text(
      title.toUpperCase(),
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    centerTitle: true,
  );
}
