// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderListTiles.dart';

// ignore: camel_case_types
class buildListViewOptions extends StatefulWidget {
  final List<Map<String, dynamic>> options;

  const buildListViewOptions({super.key, required this.options});

  @override
  State<buildListViewOptions> createState() => _buildListViewOptionsState();
}

// ignore: camel_case_types
class _buildListViewOptionsState extends State<buildListViewOptions> {
  // ignore: non_constant_identifier_names
  int? Selectedindex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.options.length, (index) {
              final item = widget.options[index];

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
