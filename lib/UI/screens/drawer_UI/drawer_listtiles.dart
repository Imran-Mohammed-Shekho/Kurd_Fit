import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  final Widget title;

  final Widget icon;
  final VoidCallback ontap;

  const ListTiles(this.title, this.icon, this.ontap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: ontap,
      leading: icon,
    );
  }
}
