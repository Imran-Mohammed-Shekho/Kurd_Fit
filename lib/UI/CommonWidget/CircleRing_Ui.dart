import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleRing extends StatefulWidget {
  final double progress;
  final dynamic icon;
  final String title;
  final String subtitle;
  const CircleRing(
    this.progress,
    this.icon,
    this.title,
    this.subtitle, {
    super.key,
  });

  @override
  State<CircleRing> createState() => _CircleRingState();
}

class _CircleRingState extends State<CircleRing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        strokeCap: StrokeCap.round,
                        value: 1,
                        valueColor: AlwaysStoppedAnimation(
                          const Color.fromARGB(255, 255, 255, 255),
                        ),
                        strokeWidth: 25,
                      ),
                    ),

                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        strokeCap: StrokeCap.round,
                        value: widget.progress,
                        valueColor: AlwaysStoppedAnimation(
                          const Color.fromARGB(255, 125, 33, 142),
                        ),
                        strokeWidth: 25,
                      ),
                    ),

                    _buildIcon(),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          widget.subtitle,

          style: TextStyle(fontSize: 20, color: const Color(0xFFFFFFFF)),
        ),

        SizedBox(height: 5),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ],
    );
  }

  Widget _buildIcon() {
    if (widget.icon is IconData) {
      return Icon(
        widget.icon,
        size: 40,
        color: const Color.fromRGBO(255, 255, 255, 1),
      );
    }

    if (widget.icon is String && widget.icon.toLowerCase().endsWith(".svg")) {
      return SvgPicture.asset(
        widget.icon,
        height: 40,
        width: 40,
        fit: BoxFit.contain,
      );
    }

    if (widget.icon is String &&
            (widget.icon.toString().toLowerCase().endsWith(".png") ||
                widget.icon.toString().toLowerCase().endsWith(".jpg")) ||
        widget.icon.toString().toLowerCase().endsWith(".gif")) {
      return Image.asset(widget.icon, height: 60, width: 60);
    }

    return widget.icon(widget.icon.help);
  }
}
