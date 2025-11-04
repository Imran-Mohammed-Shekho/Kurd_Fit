import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';

import 'package:gym/state/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  String name = '';
  String phone = '';
  String email = '';
  bool isLoad = false;

  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final getuserdata = Provider.of<ProfileProvider>(context, listen: false);
      if (getuserdata.userModel == null) {
        getuserdata.getUserDataFromFirestore(auth.currentUser!.uid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: isLoad
              ? Center(child: CircularProgressIndicator())
              : Consumer<ProfileProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: ClipOval(
                                child: Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "lib/assets/images/Ellipse.png",
                                      ),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 60),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${value.userModel?.name}".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            SizedBox(height: 10),

                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Fitness enthusiastic ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: GlassyTextField("Name", (value) {
                                name = value;
                              }, 60),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: GlassyTextField("Email", (value) {
                                setState(() {
                                  email = value;
                                });
                              }, 60),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: GlassyTextField("Phone +964 07", (value) {
                                setState(() {
                                  phone = value;
                                });
                              }, 60),
                            ),
                            SizedBox(height: 60),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DashboradBottom(
                                      () {},
                                      "Save changes",
                                      Colors.white,
                                      false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
