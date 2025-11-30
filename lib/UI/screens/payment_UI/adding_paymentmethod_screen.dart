import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/reusableAppbar.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/profile_screen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/heightScreen.dart';

class AddingPaymentmethodScreen extends StatefulWidget {
  const AddingPaymentmethodScreen({super.key});

  @override
  State<AddingPaymentmethodScreen> createState() =>
      _AddingPaymentmethodScreenState();
}

class _AddingPaymentmethodScreenState extends State<AddingPaymentmethodScreen> {
  int totalMoneyToadd = 20;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: reusableAppbar(context, "adding payment method"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildTexts("Cardholder Name "),
                    addingpaymentmethods_container(
                      "name on card",
                      Icon(Icons.person, color: Colors.white),
                    ),

                    _buildTexts("Card Number "),
                    addingpaymentmethods_container(
                      "XXXX-XXXX-XXXX-XXXX",
                      Icon(Icons.lock, color: Colors.white),
                    ),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date", style: TextStyle(color: Colors.white)),

                            SizedBox(
                              width: 130,
                              child: addingpaymentmethods_container(
                                "MM/YY",
                                Icon(Icons.date_range, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CVV", style: TextStyle(color: Colors.white)),
                            SizedBox(
                              width: 130,
                              child: addingpaymentmethods_container(
                                "XXX",
                                Icon(Icons.lock, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Divider(
                      color: Colors.white.withValues(alpha: 0.3),
                      thickness: 1,
                      endIndent: 10,
                      indent: 10,
                      height: 2,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total :".toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Column(
                          children: [
                            Text(
                              r"$" +
                                  "$totalMoneyToadd".toString().toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _buildFloatButtons(Icons.add, () {
                                  setState(() {
                                    totalMoneyToadd += 1;
                                  });
                                }),
                                SizedBox(width: 10),
                                _buildFloatButtons(Icons.remove, () {
                                  setState(() {
                                    totalMoneyToadd -= 1;
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: buildButtom(
                ontap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kred,
                      content: Text(
                        "Coming Soon !",
                        style: TextStyle(
                          color: kwhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                text: "Pay Now",
                isTrue: false,
                gradient: LinearGradient(
                  colors: [Color(0xFF6A5AE0), Color(0xFF8A73F5)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildFloatButtons(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      height: 28,
      width: 28,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 1,
              color: Color.fromARGB(255, 154, 131, 255),
              offset: Offset(0, 0),
            ),
          ],
          gradient: LinearGradient(
            colors: [Color(0xFF6A5AE0), Color(0xFF8A73F5)],
          ),
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: Icon(icon, size: 22, color: Colors.white),
        ),
      ),
    );
  }

  Padding _buildTexts(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text, style: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget addingpaymentmethods_container(hint, icon) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              showCursor: true,

              onChanged: (value) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: icon,
                hint: Text(
                  hint,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
