import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym/data/models/userData.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoad = false;
  UserModel? userModel;
  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection("users");

  Future<UserModel?> getUserDataFromFirestore(String id) async {
    isLoad = true;
    notifyListeners();
    try {
      DocumentSnapshot snap = await _collectionReference.doc(id).get();

      if (snap.exists) {
        userModel = UserModel.fromSnap(snap);
        isLoad = false;
      } else {
        return null;
      }
    } catch (e) {
      print("$e :flag");
    } finally {
      isLoad = false;
      notifyListeners();
    }
    return userModel;
  }
}
