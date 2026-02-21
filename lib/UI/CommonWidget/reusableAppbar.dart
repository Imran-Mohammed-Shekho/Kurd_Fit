import 'package:flutter/material.dart';
import 'package:gym/core/Utils/localized_text.dart';

AppBar reusableAppbar(
  BuildContext context,
  String title,
  VoidCallback onpressed,
) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: onpressed,
      icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
    ),

    title: Text(
      tr(context, title).toUpperCase(),
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    centerTitle: true,
  );
}
