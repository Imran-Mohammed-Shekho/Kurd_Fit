import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyContainer extends StatelessWidget {
  final Icon icon;
  const GlassyContainer(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 100,
        width: 100,
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.4),
                  width: 2.5,
                ),
              ),
              child: Center(child: icon),
            ),
          ),
        ),
      ),
    );
  }
}
