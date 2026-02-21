import 'package:flutter/material.dart';
import 'package:gym/core/Utils/localized_text.dart';
import 'package:gym/UI/screens/landingScreen_UI/ageScreen.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Provider.of<AppstateProvider>(
              context,
              listen: false,
            ).updatePageState(2);
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          tr(context, "Product Preview"),
          style: TextStyle(fontSize: 20),
        ),
      ),

      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
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
                      tr(context, "Product Information"),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  productinfotext(
                    "${tr(context, "Name")} : ${tr(context, title)}",
                  ),
                  SizedBox(height: 10),
                  productinfotext("${tr(context, "Price :")} $price\$"),
                  SizedBox(height: 10),
                  productinfotext(
                    "${tr(context, "Description :")} ${tr(context, descrption)}",
                  ),
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
                                tr(context, "Porduct Added To Cart"),
                                style: TextStyle(color: kwhite),
                              ),
                            ),
                          );
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ),
                          );
                        },
                        text: tr(context, "Add To Cart"),
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
