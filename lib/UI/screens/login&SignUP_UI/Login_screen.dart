import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/UI/CommonWidget/common.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/bottomnavigationbar.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Forget_screen.dart';
import 'package:gym/UI/screens/login&SignUP_UI/SignUp_screen.dart';
import 'package:gym/services/Login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final LoginService _loginService = LoginService();
  bool _isLoading = false;
  bool _obscureText = true;

  static final _emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  /// ------------ LOGIN ------------
  Future<void> _loginMethod() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final errorMessage = await _loginService.login(
      _emailController.text,
      _passwordController.text,
    );

    if (!mounted) return;

    setState(() => _isLoading = false);

    if (errorMessage == null) {
      _showSuccessSnack();
      await Future.delayed(Duration(seconds: 1));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottomnavigationbar()),
      );
    } else {
      _showErrorSnack(errorMessage);
    }
  }

  /// ------------ SNACKS ------------
  void _showErrorSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void _showSuccessSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Logged in successfully!",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  /// ------------ VALIDATORS ------------
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) return "Enter email";
    if (!_emailRegex.hasMatch(value)) return "Invalid email";
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) return "Enter password";
    if (value.length < 6) return "Password must be at least 6 chars";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Nutback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.zero,

            children: [
              const SizedBox(height: 90),

              _buildLogo(),

              const SizedBox(height: 120),

              SizedBox(height: 50),

              _buildEmailField(),
              const SizedBox(height: 15),
              _buildPasswordField(),

              _buildForgotPassword(),

              SizedBox(height: size.height * 0.04),

              _buildLoginButton(size),

              const SizedBox(height: 20),

              _buildSignUpLink(),

              const SizedBox(height: 20),
              _buildTermsText(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
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
          const Text(
            "Training, Gym, Strength",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: _glassField(
        child: TextFormField(
          controller: _emailController,
          validator: _emailValidator,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Email",
            prefixIcon: Icon(Icons.person, color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: _glassField(
        child: TextFormField(
          controller: _passwordController,
          validator: _passwordValidator,
          obscureText: _obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.lock, color: Colors.white),
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscureText = !_obscureText),
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassField({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ForgetScreen()),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, top: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
              decorationColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(Size size) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator(color: Colors.white))
        : Center(
            child: CommonButton(
              _loginMethod,
              "Login",
              Colors.white,
              _isLoading,
              Color(0xff5B58FB),
            ),
          );
  }

  Widget _buildSignUpLink() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SignupScreen()),
      ),
      child: const Center(
        child: Text(
          "Don't have an account? Sign Up",
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            fontSize: 18,
            decorationColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTermsText(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: const Text(
        "By logging in, you agree to our Terms of Service & Privacy Policy.",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.center,
      ),
    );
  }
}
