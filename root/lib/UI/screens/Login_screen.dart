import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/UI/screens/Forget_screen.dart';
import 'package:gym/UI/screens/SignUp_screen.dart';
import 'package:gym/UI/screens/bottomnavigationbar.dart';
import 'package:gym/UI/screens/introduction_screen1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  static final _emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  Future<void> _loginMethod() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;
      _showSuccessSnackbar();
      await Future.delayed(Duration(seconds: 2));

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bottomnavigationbar()),
        );
      }
    } on FirebaseAuthException catch (e) {
      _handleAutherror(e);
    } catch (e) {
      _showErrorSnackbar(e);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _handleAutherror(FirebaseAuthException e) {
    String errorMessage = '';

    switch (e.code) {
      case 'user-not-found':
        errorMessage = "No account found with this email.";
        break;
      case 'wrong-password':
        errorMessage = "Incorrect password. Please try again.";
        break;
      case 'invalid-email':
        errorMessage = "Please enter a valid email address.";
        break;
      case 'user-disabled':
        errorMessage = "This account has been disabled.";
        break;
      case 'too-many-requests':
        errorMessage = "Too many attempts. Please try again later.";
        break;
      default:
        errorMessage = "Login failed: ${e.message ?? 'Unknown error'}";
    }
    _showErrorSnackbar(errorMessage);
  }

  void _showErrorSnackbar(message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 4),
        content: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade700,
        duration: Duration(seconds: 3),
        content: Text(
          "You login in successfully ",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email ";
    }
    if (!_emailRegex.hasMatch(value.trim())) {
      return "PLease enter vaild email address";
    }
    return null;
  }

  String? _passwordVaildator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 char";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/Nutback.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),

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
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 60),
                Center(
                  child: Image.asset(
                    "lib/assets/images/man.png",
                    width: size.width * 0.25,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildEmailTextFormField(),
                        const SizedBox(height: 15),
                        _buildPasswordTextFormField(),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetScreen()),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.059),
                _buildactions(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildactions(size) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.083),
      child: Column(
        children: [
          Center(
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : IntorductionButtons(
                    _loginMethod,
                    "Login",
                    const Color(0xff5B58FB),
                  ),
          ),
          SizedBox(height: size.height * 0.059),

          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: const Text(
                "Don't have an account? Sign Up ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 1.9,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Terms text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: const Text(
              "By Login , you agree to our Terms Of Service & Privacy Policy.",
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailTextFormField() {
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
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.person, color: Colors.white),
              ),
              textInputAction: TextInputAction.next,
              validator: _emailValidator,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextFormField() {
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
                labelText: "password",
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: _obscureText
                      ? Icon(Icons.visibility_off, color: Colors.white)
                      : Icon(Icons.visibility, color: Colors.white),
                ),
              ),
              textInputAction: TextInputAction.done,
              validator: _passwordVaildator,
              obscureText: _obscureText,
            ),
          ),
        ),
      ),
    );
  }
}
