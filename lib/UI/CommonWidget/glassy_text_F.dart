import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/core/Utils/localized_text.dart';

class GlassyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? _controller;
  final ValueChanged<String> onChanged;
  final double height;
  const GlassyTextField(
    this.hintText,
    this.onChanged,
    this.height,
    this._controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              strokeAlign: BorderSide.strokeAlignCenter,
              style: BorderStyle.solid,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: TextField(
              controller: _controller,
              onChanged: onChanged,
              obscureText: hintText == "Password" ? true : false,

              // maxLength: 24,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: tr(context, hintText),
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
