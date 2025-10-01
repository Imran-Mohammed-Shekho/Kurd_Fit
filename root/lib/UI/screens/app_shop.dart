import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Dashboard_Screen.dart';
import 'package:gym/UI/screens/Login_screen.dart';
import 'package:gym/data/models/supplement_class.dart';

class App_Shop extends StatefulWidget {
  const App_Shop({super.key});

  @override
  State<App_Shop> createState() => _App_ShopState();
}

class _App_ShopState extends State<App_Shop> {
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

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    kurdfittext(),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Colors.red, size: 30),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GlassyTextField("Search", (value) {}),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 150,
                  width: double.infinity,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "lib/assets/images/creatine.jpg",
                      fit: BoxFit.cover,
                      scale: 0.5,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Products",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            supplements[index].imagePath,
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
