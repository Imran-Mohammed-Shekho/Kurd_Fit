import 'dart:ui';

import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/Nutback.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    ),
                    SizedBox(width: 70),
                    Padding(
                      padding: EdgeInsetsGeometry.only(),
                      child: Text(
                        "payment methods ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                paymentmethodstext("Your Balance"),

                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                    child: SizedBox(
                      height: 100,
                      width: 350,
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
                  ),
                ),
                SizedBox(height: 20),

                paymentmethodstext("Payment Methods "),

                paymentmethodsListtiles(),

                SizedBox(height: 20),
                paymentmethodsListtiles(),

                Spacer(),

                ADDPMB("Add payment method", context, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddingPaymentmethodScreen(),
                    ),
                  );
                }),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget ADDPMB(String text, BuildContext context, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: SizedBox(
      height: 50,
      width: 350,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xff5B58FB),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xffffffff).withValues(alpha: 0.5),
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

class paymentmethodsListtiles extends StatelessWidget {
  const paymentmethodsListtiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
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
      padding: EdgeInsetsGeometry.only(left: 30, bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
