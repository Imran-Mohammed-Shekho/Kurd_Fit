import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/state/providers/language_provider.dart';
import 'package:provider/provider.dart';

void showmodelbottomsheet(BuildContext context) {
  final language = Provider.of<LanguageProvider>(context, listen: false);
  showModalBottomSheet(
    barrierLabel: "Select Language",
    backgroundColor: Colors.deepPurpleAccent.shade200,
    context: context,
    builder: (context) => ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white60.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
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
                              fontSize: 16,
                            ),
                          ),
                          trailing: language.isselected(lang)
                              ? Icon(Icons.check, color: Colors.black)
                              : null,

                          onTap: () => language.change_language(lang),
                        );
                      }).toList(),
                    ],
                  );
                },
          ),
        ),
      ),
    ),
  );
}
