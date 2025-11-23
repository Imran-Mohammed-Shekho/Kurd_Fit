import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym/data/models/userInfoModel.dart';

class SignupService {
  final _userInfoCollection = FirebaseFirestore.instance.collection("userInfo");
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
        return "email is already registered. Please login instead.";

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

  Future<bool> saveUserData({
    required uid,
    required int age,
    required String gender,
    required String name,
    required String goal,
    required String fitnessLevel,
    required int height,
    required String issues,
    required int workoutsPerWeek,
    required List<String> bodyFoucs,
    required int weight,
    required String activityLevel,
  }) async {
    try {
      final Userinfomodel data = Userinfomodel(
        age: age,
        gender: gender,
        name: name,
        goal: goal,
        fitnessLevel: fitnessLevel,
        height: height,
        issues: issues,
        workoutsPerWeek: workoutsPerWeek,
        bodyFoucs: bodyFoucs,
        weight: weight,
        activityLevel: activityLevel,
      );

      await _userInfoCollection
          .doc(uid)
          .set(data.toJson(), SetOptions(merge: true));

      return true; // success
    } catch (e) {
      print("ERROR Saving data: $e");
      return false; // fail
    }
  }
}
