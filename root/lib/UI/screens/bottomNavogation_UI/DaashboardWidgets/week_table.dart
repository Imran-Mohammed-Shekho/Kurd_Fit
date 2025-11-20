import 'package:flutter/material.dart';

class WeekTable extends StatelessWidget {
  final bool isToday;
  final String label;
  final double height;

  const WeekTable({
    super.key,
    required this.isToday,
    required this.label,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          width: 40,
          decoration: BoxDecoration(
            color: isToday ? Colors.purple : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
