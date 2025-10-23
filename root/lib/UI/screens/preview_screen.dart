import 'package:flutter/material.dart';

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
                        padding: EdgeInsets.symmetric(horizontal: 10),

                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 60,
                              width: 330,

                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0xff727bff),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.4),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Add To Cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
