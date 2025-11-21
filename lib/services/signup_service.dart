import 'package:firebase_auth/firebase_auth.dart';

class SignupService {
  final _auth = FirebaseAuth.instance;
  Future signUp({required emailController, required passwordController}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      _auth.currentUser!.sendEmailVerification();

      return userCredential; // it means verfiy link just sent
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return "smothing went wrong";
    }
  }

  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "This email is already registered. Please login instead.";

      case 'invalid-email':
        return "Please enter a valid email address.";

      case 'operation-not-allowed':
        return "Email/password accounts are not enabled. Please contact support.";

      case 'weak-password':
        return "Password is too weak. Please use a stronger password.";

      case 'network-request-failed':
        return "Network error. Please check your internet connection.";

      default:
        return "Registration failed: ${e.message ?? 'Unknown error'}";
    }
  }
}
