// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderListTiles.dart';

class buildListViewOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildListOptions(title: 'Male', iconData: Icons.male),
              buildListOptions(title: 'Female', iconData: Icons.female),
              buildListOptions(title: 'Other', iconData: Icons.transgender),
            ],
          ),
        ],
      ),
    );
  }
}
