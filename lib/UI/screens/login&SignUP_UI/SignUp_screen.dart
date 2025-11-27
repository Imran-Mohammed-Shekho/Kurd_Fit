import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/UI/CommonWidget/resuableProgressIndicator.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/heightScreen.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';
import 'package:gym/UI/screens/login&SignUP_UI/check_emailVerfication.dart';
import 'package:gym/UI/screens/login&SignUP_UI/reusableIcon.dart';
import 'package:gym/services/signup_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  // Validation patterns
  static final _emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  static final _nameRegex = RegExp(r'^[a-zA-Z\s]{2,50}$');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signupMethod() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    final result = await SignupService().signUp(
      emailController: _emailController,
      passwordController: _passwordController,
    );
    if (!mounted) return;
    Future.delayed(Duration(seconds: 2));
    setState(() => _isLoading = false);
    if (result is UserCredential) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckEmailVerification(
            userCreditional: result,
            emailController: _emailController,
            nameController: _nameController,
          ),
        ),
      );
    }

    if (result is String) {
      _showErrorSnackBar(result);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade700,
        content: Text(message, style: const TextStyle(color: Colors.white)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (!_nameRegex.hasMatch(value.trim())) {
      return 'Please enter a valid name (letters and spaces only)';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: kwhite),
          ),
        ),
        backgroundColor: const Color(0xff6157C9),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildHeaderSection(),

              const SizedBox(height: 60),

              Reusableicon(icondata: Icons.fitness_center),

              const SizedBox(height: 40),

              _buildFormFieldsSection(),

              SizedBox(height: size.height * 0.059),

              _buildActionSection(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kurd Fit",
            style: GoogleFonts.pacifico(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Training, Gym, Strength",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFieldsSection() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNameTextField(),
            const SizedBox(height: 15),
            _buildEmailTextField(),
            const SizedBox(height: 15),
            _buildPasswordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.4),
              strokeAlign: BorderSide.strokeAlignCenter,
              style: BorderStyle.solid,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person, color: Colors.white),
                labelText: "Full name ",
                labelStyle: TextStyle(color: Colors.white),
              ),
              validator: _validateName,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.4),
              strokeAlign: BorderSide.strokeAlignCenter,
              style: BorderStyle.solid,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email, color: Colors.white),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white),
              ),
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.4),
              strokeAlign: BorderSide.strokeAlignCenter,
              style: BorderStyle.solid,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person, color: Colors.white),
                labelText: "Password ",
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: _obscurePassword
                      ? Icon(Icons.visibility_off, color: Colors.white)
                      : Icon(Icons.visibility, color: Colors.white),
                ),
              ),
              obscureText: _obscurePassword,
              validator: _validatePassword,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionSection(Size size) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.083),
      child: Column(
        children: [
          // Sign Up Button
          Center(
            child: _isLoading
                ? const reusableProgressIndicator()
                : buildButtom(
                    ontap: () => _signupMethod(),
                    text: "Sign Up",
                    isTrue: false,
                  ),
          ),

          SizedBox(height: size.height * 0.059),

          // Login Link
          Center(
            child: InkWell(
              focusColor: kwhite,
              onTap: _isLoading
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
              child: Text(
                "Already have an account? Login",
                style: TextStyle(
                  color: _isLoading ? Colors.white60 : Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationColor: _isLoading ? Colors.white60 : Colors.white,
                  decorationThickness: 1.9,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Terms Text
          _buildTermsText(size),
        ],
      ),
    );
  }

  Widget _buildTermsText(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: const Text(
        "By signing up, you agree to our Terms Of Service & Privacy Policy.",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.center,
      ),
    );
  }
}
