// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';

class buildListOptions extends StatelessWidget {
  final String title;
  final IconData iconData;

  const buildListOptions({required this.title, required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 60,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: kwhite.withOpacity(0.2),
            border: Border.all(color: kwhite.withOpacity(0.06)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: ListTile(
              title: Text(title, style: TextStyle(fontSize: 18, color: kwhite)),
              trailing: Icon(iconData, color: kwhite, size: 32),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
