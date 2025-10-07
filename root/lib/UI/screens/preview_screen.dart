import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class PreviewScreen extends StatelessWidget {
  final String path;
  final double price;
  final String title;
  final String descrption;
  const PreviewScreen(
    this.path,
    this.title,
    this.price,
    this.descrption, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              ClipRRect(child: Image.asset(path, height: 300, width: 300)),
              Expanded(
                child: GlowContainer(
                  width: double.infinity,
                  height: 400,
                  glowColor: Colors.white.withOpacity(0.2),

                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 2,
                  margin: EdgeInsets.all(10),
                  borderRadius: BorderRadius.all(Radius.circular(20)),

                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Product Information",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
                        padding: EdgeInsets.symmetric(horizontal: 20),

                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GlowButton(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff727bff),
                            glowColor: Colors.white,
                            height: 60,
                            width: 200,

                            child: Center(
                              child: Text(
                                "Add To Cart?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: () {},
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
