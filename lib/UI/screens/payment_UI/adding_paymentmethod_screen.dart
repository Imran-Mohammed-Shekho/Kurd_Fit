import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ),
                SizedBox(width: 50),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Adding payment method ".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cardholder Name ",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            addingpaymentmethods_container(
              "name on card",
              Icon(Icons.person, color: Colors.white),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Card Number ",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            addingpaymentmethods_container(
              "XXXX-XXXX-XXXX-XXXX",
              Icon(Icons.lock, color: Colors.white),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    "Date",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 125),
                  child: Text(
                    "CVV",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    child: addingpaymentmethods_container(
                      "MM/YY",
                      Icon(Icons.date_range, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: addingpaymentmethods_container(
                      "XXX",
                      Icon(Icons.lock, color: Colors.white),
                    ),
                  ),
                ],
              ),
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
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Total :".toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hint: Text(
                          "\$20".toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            buildButtom(
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
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget addingpaymentmethods_container(hint, icon) {
  return SizedBox(
    height: 50,
    width: 350,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        showCursor: true,

        onChanged: (value) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: icon,
          hint: Text(hint, style: TextStyle(fontSize: 14, color: Colors.white)),
        ),
      ),
    ),
  );
}
