import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/shop_UI/Cart_screen.dart';
import 'package:gym/state/providers/appState_Provider.dart';
import 'package:provider/provider.dart';

class PreviewScreen extends StatelessWidget {
  final String path;
  final double price;
  final String title;
  final String descrption;
  final int index;
  const PreviewScreen(
    this.path,
    this.title,
    this.price,
    this.descrption,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Provider.of<AppstateProvider>(
                      context,
                      listen: false,
                    ).updatePageState(2);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
            ClipRRect(
              child: Hero(
                tag: "tag$index",
                child: Image.asset(path, height: 300, width: 300),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 400,

                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),

                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Product Information",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 30),
                    productinfotext("Name : $title"),
                    SizedBox(height: 10),
                    productinfotext("Price : $price\$"),
                    SizedBox(height: 10),
                    productinfotext("Description : $descrption"),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: buildButtom(
                          ontap: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.fixed,
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Porduct Added To Cart",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                            await Future.delayed(Duration(seconds: 3));
                            Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(),
                              ),
                            );
                          },
                          text: "Add To Cart",
                          isTrue: false,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class productinfotext extends StatelessWidget {
  final String text;

  const productinfotext(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
