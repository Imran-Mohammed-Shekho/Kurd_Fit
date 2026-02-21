// ignore_for_file: file_names, unused_field

import 'package:flutter/material.dart';
import 'package:gym/core/Utils/localized_text.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Namescreen extends StatefulWidget {
  const Namescreen({super.key});

  @override
  State<Namescreen> createState() => _NamescreenState();
}

class _NamescreenState extends State<Namescreen> {
  String _name = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 49),
                  child: buildQuestionText(text: "What is your Name?"),
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: size.height * 0.5,
                    width: double.infinity,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 28,
                        color: kwhite,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) => setState(() {
                        _name = value;
                      }),
                      keyboardType: TextInputType.name,
                      cursorColor: kwhite,
                      cursorHeight: 34,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: tr(
                          context,
                          "Please Enter your name right here ..",
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: buildButtom(
                    ontap: () {
                      final prov = context.read<LandingscreenProvider>();
                      prov.setName(_name);

                      if (prov.name.isNotEmpty) {
                        prov.changeCurrentIndex();
                      }
                    },
                    text: "Contine",
                    isTrue: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
