import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:provider/provider.dart';

void showmodelbottomsheet(BuildContext context) {
  showModalBottomSheet(
    barrierLabel: "Select Language",
    backgroundColor: Colors.white.withValues(alpha: 0.1),
    context: context,
    builder: (context) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
          ),
          child: Consumer<LanguageProvider>(
            builder:
                (
                  BuildContext context,
                  LanguageProvider language,
                  Widget? child,
                ) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...language.languages.map((lang) {
                        return ListTile(
                          title: Text(
                            lang,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          trailing: language.isselected(lang)
                              ? Icon(Icons.check, color: Colors.white, size: 30)
                              : null,

                          onTap: () {
                            language.changeLanguage(lang);
                            Navigator.pop(context);
                          },
                        );
                      }),
                    ],
                  );
                },
          ),
        ),
      ),
    ),
  );
}
