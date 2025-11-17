import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/BmiResultScreen.dart';
import 'package:gym/core/Utils/BMICalculatorBrain.dart';

Future<void> bmiResult(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BmiScreen(),
  );
}

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _fadeAnimation;
  late Animation<double> _slideAnimation;

  // ignore: non_constant_identifier_names
  var _Height = 100.0;
  // ignore: prefer_final_fields, non_constant_identifier_names
  var _Weight = 20.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 700),

      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _slideAnimation = Tween<double>(
      begin: 80,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: _buildModelBottomSheet(context, size),
          ),
        );
      },
    );
  }

  Widget _buildModelBottomSheet(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.6,
      padding: const EdgeInsets.all(18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Your BMI Calclator",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Text(
                          "Height",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsGeometry.all(5),
                        child: Text(
                          "${_Height.toStringAsFixed(0)} cm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Slider(
                    min: 100.0,
                    max: 230.0,
                    activeColor: Colors.red,
                    thumbColor: Colors.redAccent,
                    inactiveColor: Colors.white,
                    value: _Height,
                    onChanged: (value) {
                      setState(() {
                        _Height = value;
                      });
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Text(
                          "Weight",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsGeometry.all(5),
                        child: Text(
                          "${_Weight.toStringAsFixed(0)} Kg",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Slider(
                    min: 20.0,
                    max: 250.0,
                    activeColor: const Color.fromARGB(205, 255, 179, 0),
                    thumbColor: Colors.amber,
                    inactiveColor: Colors.white,
                    value: _Weight,
                    onChanged: (value) {
                      setState(() {
                        _Weight = value;
                      });
                    },
                  ),
                  SizedBox(height: 30),

                  CommonButton(
                    () async {
                      Bmicalculatorbrain bmi = Bmicalculatorbrain(
                        Height: _Height,
                        Weight: _Weight,
                      );
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                            strokeWidth: 5,
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                      );
                      await Future.delayed(Duration(seconds: 2));
                      if (mounted) Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiResultScreen(
                            bmi.BmiResult(),
                            bmi.getResult(),
                            bmi.getInter(),
                          ),
                        ),
                      );
                    },
                    "Calculate",
                    Colors.black,
                    false,
                    Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }
}
