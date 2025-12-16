// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';

class buildListOptions extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onselect;
  final bool isSelected;

  const buildListOptions({
    super.key,
    required this.title,
    required this.iconData,
    this.onselect,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 60,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isSelected
                ? kwhite.withOpacity(0.4)
                : kwhite.withOpacity(0.2),
            border: Border.all(
              color: isSelected
                  ? kwhite.withOpacity(0.6)
                  : kwhite.withOpacity(0.06),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: ListTile(
              title: Text(title, style: TextStyle(fontSize: 18, color: kwhite)),
              trailing: Icon(iconData, color: kwhite, size: 32),
              onTap: () => onselect!(title),
            ),
          ),
        ),
      ),
    );
  }
}
