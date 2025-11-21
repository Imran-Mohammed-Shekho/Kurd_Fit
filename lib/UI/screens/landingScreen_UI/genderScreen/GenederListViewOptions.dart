// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderListTiles.dart';

class buildListViewOptions extends StatefulWidget {
  const buildListViewOptions({super.key});

  @override
  State<buildListViewOptions> createState() => _buildListViewOptionsState();
}

class _buildListViewOptionsState extends State<buildListViewOptions> {
  int? Selectedindex;

  List<Map<String, dynamic>> options = [
    {"title": "Male", "icon": Icons.male},
    {"title": "Female", "icon": Icons.female},
    {"title": "Other", "icon": Icons.transgender},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(options.length, (index) {
              final item = options[index];

              return buildListOptions(
                title: item["title"],
                iconData: item["icon"],
                ontap: () => setState(() {
                  Selectedindex = index;
                }),
                isSelected: Selectedindex == index,
              );
            }),
          ),
        ],
      ),
    );
  }
}
