import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/reusableAppbar.dart';
import 'package:gym/UI/screens/appTheme/custom_colors.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/payment_UI/adding_paymentmethod_screen.dart';

class PaymentsubscreptionScreen extends StatefulWidget {
  const PaymentsubscreptionScreen({super.key});

  @override
  State<PaymentsubscreptionScreen> createState() =>
      _PaymentsubscreptionScreenState();
}

class _PaymentsubscreptionScreenState extends State<PaymentsubscreptionScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final customButtonColor = Theme.of(context).extension<CustomColors>();
    return SafeArea(
      child: Scaffold(
        appBar: reusableAppbar(context, "payment methods "),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    paymentmethodstext("Your Balance"),

                    SizedBox(
                      height: 100,
                      width: size.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$120.00",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                "USD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    paymentmethodstext("Payment Methods "),
                    paymentmethodsListtiles(),
                    paymentmethodsListtiles(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: buildButtom(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddingPaymentmethodScreen(),
                    ),
                  );
                },
                text: "Add payment method",
                isTrue: true,
                gradient: customButtonColor!.buttomColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class paymentmethodsListtiles extends StatelessWidget {
  const paymentmethodsListtiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
          child: SizedBox(
            height: 70,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: ListTile(
                title: Text(
                  "Credit Card ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "visa ending in 9783",
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.wallet, color: Colors.white),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget paymentmethodstext(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsetsGeometry.only(bottom: 10),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
    ),
  );
}
