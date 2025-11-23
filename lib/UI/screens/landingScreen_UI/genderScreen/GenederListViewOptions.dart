// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderListTiles.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class buildListViewOptions extends StatefulWidget {
  final List<Map<String, dynamic>> options;
  final Function(String)? onselect;
  final String typeKey;

  const buildListViewOptions({
    super.key,
    required this.options,
    required this.onselect,
    required this.typeKey,
  });

  @override
  State<buildListViewOptions> createState() => _buildListViewOptionsState();
}

// ignore: camel_case_types
class _buildListViewOptionsState extends State<buildListViewOptions> {
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    final pro = context.watch<LandingscreenProvider>();

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
                onselect: (value) {
                  widget.onselect!(value);
                  pro.AddSelectedIndex(widget.typeKey, index);
                },
                isSelected: pro.getSelected(widget.typeKey) == index,
              );
            }),
          ),
        ],
      ),
    );
  }
}
