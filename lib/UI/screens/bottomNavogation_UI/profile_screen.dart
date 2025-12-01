import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/show_logOut_Alertt.dart';
import 'package:gym/UI/screens/landingScreen_UI/GoalScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';
import 'package:gym/state/providers/profile_provider.dart';
import 'package:provider/provider.dart';

const Color kred = Color.fromARGB(255, 148, 10, 0);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      if (getuserdata.userInfo == null) {
        getuserdata.getUserInfoFromFirestore(auth.currentUser!.uid);
      }
    });
  }

  Future<void> _deleteUser() async {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
    final auth = FirebaseAuth.instance;
    try {
      await Future.delayed(Duration(seconds: 2));

      await auth.currentUser!.delete();
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        _showMessage(
          "requires-recent-login",
          const Color.fromRGBO(244, 67, 54, 1),
        );
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            insetPadding: EdgeInsets.all(20),
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            content: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                child: SizedBox(
                  height: 200,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: kwhite.withOpacity(0.2),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Please read the info below",
                              style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          Center(
                            child: Text(
                              "you need to login again to able delete your account ",
                              style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),

                          Center(
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromRGBO(244, 67, 54, 1),
                                ),
                              ),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                );
                                await Future.delayed(Duration(seconds: 2));
                                Navigator.pop(context);

                                if (mounted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                }
                              },
                              child: Center(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(
                                      255,
                                      255,
                                      255,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        _showMessage(e.code, const Color.fromRGBO(244, 67, 54, 1));
      }
    } catch (e) {
      _showMessage("$e", const Color.fromARGB(255, 218, 3, 3));
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        behavior: SnackBarBehavior.fixed,
        content: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: isLoad
            ? Center(child: CircularProgressIndicator())
            : Consumer<ProfileProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/Ellipse.png",
                            ),
                            radius: 40,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "${value.userInfo?.name}".toUpperCase(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            (value.userModel?.email ?? "Unknown"),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(
                            color: kwhite.withValues(alpha: 0.5),
                            endIndent: 8,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Personal Information".toUpperCase(),
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                          _reusableProfileTile(
                            Icons.person,
                            "Name",
                            () {},
                            TextField(
                              textAlign: TextAlign.right,

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: value.userInfo?.name ?? "Unknown",
                                hintStyle: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),

                          _reusableProfileTile(
                            Icons.calendar_today,
                            "Age",
                            () {},
                            TextField(
                              textAlign: TextAlign.right,

                              cursorColor: kred,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    value.userInfo?.age.toString() ?? "Unknown",
                                hintStyle: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          _reusableProfileTile(
                            CupertinoIcons.person_fill,
                            "Gender",
                            () {},
                            TextField(
                              textAlign: TextAlign.right,

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    value.userInfo?.gender.toString() ??
                                    "Unknown",
                                hintStyle: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),

                          _reusableProfileTile(
                            Icons.fitness_center,
                            "Weight",
                            () {},
                            TextField(
                              textAlign: TextAlign.right,

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    value.userInfo?.weight.toString() ??
                                    "Unknown",
                                hintStyle: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          _reusableProfileTile(
                            Icons.height,
                            "Height",
                            () {},
                            TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    value.userInfo?.height.toString() ??
                                    "Unknown",
                                hintStyle: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),

                          Divider(
                            color: kwhite.withValues(alpha: 0.2),
                            endIndent: 10,
                            indent: 10,
                          ),
                          _reusableProfileTile(
                            Icons.track_changes_rounded,
                            "Goal",
                            () {},
                            TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: value.userInfo?.goal ?? "Unknown",
                                hintStyle: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),

                          _reusableProfileTile(
                            Icons.accessibility_new_outlined,
                            "Body Foucs",
                            () {},
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                width: 130,
                                child: TextField(
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        value.userInfo?.bodyFoucs.toString() ??
                                        "Unknown",
                                    hintStyle: TextStyle(
                                      color: kwhite,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _reusableProfileTile(
                            Icons.flag_circle_rounded,
                            "Fitness Level",
                            () {},
                            TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    value.userInfo?.fitnessLevel ?? "Unknown",
                                hintStyle: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          _reusableProfileTile(
                            Icons.fitness_center_rounded,
                            "Workouts per Week",
                            () {},
                            TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    value.userInfo?.workoutsPerWeek
                                        .toString() ??
                                    "Unknown",
                                hintStyle: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

  ListTile _reusableProfileTile(
    icon,
    title,
    VoidCallback ontap,
    dynamic widget,
  ) {
    return ListTile(
      trailing: SizedBox(width: 130, child: widget),
      onTap: ontap,
      leading: SizedBox(
        height: 30,
        width: 30,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: DecoratedBox(
            decoration: BoxDecoration(color: kwhite.withValues(alpha: 0.1)),
            child: Icon(icon, size: 22),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: kwhite,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}



// Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 25),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: buildButtom(
//                                     ontap: () {
//                                       showdLogOutAlert(
//                                         context: context,
//                                         title: "Deleting your Account",
//                                         message:
//                                             "Please be carefull you are going to delete your account . after you click on Red  Button you won't be able to login to that account again .",
//                                         onLogoutPressed: () {
//                                           _deleteUser();
//                                         },
//                                       );
//                                     },
//                                     text: "Delete account",
//                                     isTrue: false,
//                                     color: kred,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),