import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// -------- LOGIN METHOD --------
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return _firebaseErrorMessage(e.code);
    } catch (e) {
      return "Something went wrong. Please try again.";
    }
  }

  /// -------- ERROR HANDLER --------
  String _firebaseErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return "No account found with this email.";
      case 'wrong-password':
        return "Incorrect password. Please try again.";
      case 'invalid-email':
        return "Please enter a valid email address.";
      case 'user-disabled':
        return "This account has been disabled.";
      case 'too-many-requests':
        return "Too many attempts. Please try again later.";
      default:
        return "Login failed. Try again.";
    }
  }
}
