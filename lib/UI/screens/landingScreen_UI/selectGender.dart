import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/introduction_screen1.dart';

class selectGender extends StatefulWidget {
  const selectGender({super.key});

  @override
  State<selectGender> createState() => _selectGenderState();
}

class _selectGenderState extends State<selectGender> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/11.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 20,
                    width: size.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black12,
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 300,
                    height: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        border: Border.all(color: Colors.black38),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, color: Color(0xff5B58FB)),
                      Icon(Icons.circle, color: Color(0xff5B58FB)),
                      Icon(Icons.circle, color: Color(0xff5B58FB)),
                    ],
                  ),
                ],
              ),

              Expanded(child: Center(child: Text("What is your gender?"))),
              Expanded(
                flex: 4,
                child: ListView(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        title: Text("Male"),
                        trailing: Icon(Icons.male),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Introduction1()),
                    (route) => false,
                  );
                },
                child: SizedBox(
                  width: 350,
                  height: 20,

                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 146, 146, 146),
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff5B58FB),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
