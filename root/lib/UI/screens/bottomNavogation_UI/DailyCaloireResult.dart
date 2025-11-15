import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gym/data/models/calorie_result.dart';

Future<void> DailyCaloireResult(CalorieResult? calorie, BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _AnimatedCalorieSheet(calorie: calorie!),
  );
}

class _AnimatedCalorieSheet extends StatefulWidget {
  final CalorieResult calorie;

  const _AnimatedCalorieSheet({required this.calorie});

  @override
  State<_AnimatedCalorieSheet> createState() => _AnimatedCalorieSheetState();
}

class _AnimatedCalorieSheetState extends State<_AnimatedCalorieSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  double animatedKcalB = 0;
  double recommendedCalories = 0;
  double tdde = 0;

  @override
  void initState() {
    super.initState();

    // Main animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // Smooth slide and fade-in animations
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<double>(
      begin: 80,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start animation
    _controller.forward();

    // Animate calorie numbers
    _animateNumbers();
  }

  void _animateNumbers() async {
    double targetKcal = widget.calorie.Bmr.toDouble();
    double targetProtein = widget.calorie.RecommendedCalories.toDouble();
    double targetTdde = widget.calorie.RecommendedCalories.toDouble();

    for (var i = 0; i <= 40; i++) {
      await Future.delayed(const Duration(milliseconds: 15));
      setState(() {
        animatedKcalB = targetKcal * (i / 40);
        recommendedCalories = targetProtein * (i / 40);
        tdde = targetTdde * (i / 40);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (_, __) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: _buildBottomSheet(context),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: 300,
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
                    "🔥 Your Daily Calories",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Calories row
                  _buildAnimatedRow(
                    icon: Icons.local_fire_department_rounded,
                    label:
                        "Calories burned at rest :\n${animatedKcalB.toStringAsFixed(0)} kcal",
                    color: Colors.green,
                  ),

                  const SizedBox(height: 12),
                  _buildAnimatedRow(
                    icon: Icons.fitness_center_rounded,
                    label:
                        "Total daily calorie burn\n${tdde.toStringAsFixed(0)} ",
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),

                  // Protein row
                  _buildAnimatedRow(
                    icon: Icons.local_fire_department,
                    label:
                        "Recommended calories adjusted based on goal\n${recommendedCalories.toStringAsFixed(0)} ",
                    color: Colors.amber,
                  ),

                  Image.asset("lib/assets/images/Fireanimation.gif"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedRow({
    required IconData icon,
    required String label,
    Color? color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        Icon(icon, color: color, size: 32),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
