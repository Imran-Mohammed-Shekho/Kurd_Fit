import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyContainer extends StatelessWidget {
  final String title;
  final String subtitle;

  const GlassyContainer(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: SizedBox(
            height: 100,
            width: double.infinity,

            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      "+10%",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 255, 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
