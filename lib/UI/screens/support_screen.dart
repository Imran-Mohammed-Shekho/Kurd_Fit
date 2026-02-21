import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/glassy_text_F.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/profile_screen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/core/Utils/localized_text.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  String name = '';
  String email = '';
  String usermessage = '';
  bool isload = false;
  final auth = FirebaseAuth.instance;
  final CollectionReference help = FirebaseFirestore.instance.collection(
    "help",
  );

  Future<void> _validate() async {
    if (name.isEmpty || email.isEmpty || usermessage.isEmpty) {
      _showesnackbar(tr(context, "fill all text boxes please! "));
      return;
    } else {
      setState(() {
        isload = true;
      });
    }

    try {
      await help.doc(auth.currentUser!.uid).set({
        "name": name,
        "Email": email,
        "userMessage": usermessage,
        "CreatedAt": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      _showesnackbar("$e");
    } finally {
      setState(() {
        isload = false;

        _showesnackbar(
          tr(context, "Your message has been sent !"),
          isSuccess: true,
        );
      });
    }
  }

  void _showesnackbar(String message, {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: isSuccess ? Colors.green : kred,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            SizedBox(height: 10),

            Center(
              child: Text(
                tr(context, "We are here to help!"),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                tr(
                  context,
                  "Have Questions or Need Assistance ?\nReach Out To Us!",
                ),
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GlassyTextField(
                "Name",
                (value) => setState(() {
                  name = value;
                }),
                60,
                null,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GlassyTextField(
                "Email",
                (value) => setState(() {
                  email = value;
                }),
                60,
                null,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GlassyTextField(
                "write your problem here...",
                (value) => setState(() {
                  usermessage = value;
                }),
                120,
                null,
              ),
            ),
            SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: buildButtom(
                ontap: () {
                  _validate();
                },
                text: tr(context, "Submit"),
                isTrue: false,
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white.withValues(alpha: 0.3),
                      endIndent: 10,
                      indent: 10,
                      thickness: 2,
                    ),
                  ),
                  Center(
                    child: Text(
                      tr(context, "Or"),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white.withValues(alpha: 0.3),
                      endIndent: 10,
                      indent: 10,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                tr(context, "Also You can Find Us here"),
                style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                social("assets/images/facebook.png"),
                SizedBox(width: 30),
                social("assets/images/twitter.png"),
                SizedBox(width: 30),
                social("assets/images/gmail.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class social extends StatelessWidget {
  final String path;
  const social(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,

      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.3),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Image.asset(path, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
